import Foundation
import Moya

public extension MoyaProvider {
    func request(_ target: Target) async throws -> Moya.Response {
        let asyncRequestWrapper = AsyncMoyaRequestWrapper { [weak self] continuation in
            guard let self = self else { return nil }
            return self.request(target) { result in
                switch result {
                case .success(let response):
                    continuation.resume(with: .success(response))
                case .failure(let moyaError):
                    continuation.resume(throwing: moyaError)
                }
            }
        }

        return try await withTaskCancellationHandler(operation: {
            try await withCheckedThrowingContinuation({ continuation in
                asyncRequestWrapper.perform(continuation: continuation)
            })
        }, onCancel: {
            asyncRequestWrapper.cancel()
        })
    }

    func requestWithProgress(_ target: Target) async -> AsyncStream<Result<ProgressResponse, MoyaError>> {
        AsyncStream { stream in
            let cancellable = self.request(target, progress: { progress in
                stream.yield(.success(progress))
            }, completion: { result in
                switch result {
                case .success:
                    stream.finish()
                case .failure(let error):
                    stream.yield(.failure(error))
                    stream.finish()
                }
            })
            stream.onTermination = { @Sendable _ in
                cancellable.cancel()
            }
        }
    }
}
