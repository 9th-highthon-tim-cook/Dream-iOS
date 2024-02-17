import SwiftUI

struct KakaoButton: View {

    let action: () -> Void
 
    init(action: @escaping () -> Void) {
        self.action = action
    }

    var body: some View {
            Button(action: action) {
                HStack(spacing: 8) {
                    Image(uiImage: UIImage(named: "kakao")!)
                        .scaledToFit()
                        .frame(height: 21.52)

                    Text("카카오 로그인")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                        
                }
            }
            .frame(height: 46)
            .frame(maxWidth: .infinity)
            .background(Color("kakao"))
            .cornerRadius(12)

    }
}

struct KakaoButtonPreView: View {
    var body: some View {
        KakaoButton(action: {})
        .padding()
    }
}

@available(iOS 16, macOS 13, *)
#Preview {
    return KakaoButtonPreView()
}
