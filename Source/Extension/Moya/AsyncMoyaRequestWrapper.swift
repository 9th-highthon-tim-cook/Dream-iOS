import Moya

class AsyncMoyaRequestWrapper {
   internal typealias MoyaContinuation = CheckedContinuation<Response, Error>

   var performRequest: (MoyaContinuation) -> Moya.Cancellable?
   var cancellable: Moya.Cancellable?

   init(_ performRequest: @escaping (MoyaContinuation) -> Moya.Cancellable?) {
       self.performRequest = performRequest
   }

   func perform(continuation: MoyaContinuation) {
       cancellable = performRequest(continuation)
   }

   func cancel() {
       cancellable?.cancel()
   }
}
