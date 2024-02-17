import SwiftUI

struct PaymentButton: View {

    let image: Image
    let title: String
    let action: () -> Void
    
    init(
        image: Image,
        title: String,
        action: @escaping () -> Void
    ) {
        self.image = image
        self.title = title
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 69){
                image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 74)
                Text(title)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.black)
            }
            .frame(height: 128)
            .frame(maxWidth: .infinity)
            .background(Color(uiColor: UIColor(named: "netural50")!))
            .cornerRadius(20)
        }
        .padding([.leading, .trailing], 58)
    }
}

struct PaymentButtonPreView: View {
    var body: some View {
        PaymentButton(
            image:  Image("credit_card"),
            title: "신용카드",
            action: {
            
            })
        .padding()
    }
}

@available(iOS 16, macOS 13, *)
#Preview {
    return PaymentButtonPreView()
}
