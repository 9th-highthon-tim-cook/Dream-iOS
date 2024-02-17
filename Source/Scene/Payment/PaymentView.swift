import SwiftUI

struct PaymentView: View {
    let amount: String
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Group {
                Text("\(amount)")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color(uiColor: UIColor(named: "primary500")!))
                +
                Text("원 결제")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.black)
            }
            .padding(.leading, 58)
            PaymentButton(
                image: Image("credit_card"),
                title: "신용카드",
                action: {
                })
            PaymentButton(
                image: Image("money_bag"),
                title: "무통장입금",
                action: {
                })
            PaymentButton(
                image: Image("pass_book"),
                title: "계좌이체",
                action: {
                })
        }
        
        
    }
}

struct PaymentViewPreView: View {
    var body: some View {
        PaymentView(amount: "100,000")
    }
}

@available(iOS 16, macOS 13, *)
#Preview {
    return PaymentViewPreView()
}
