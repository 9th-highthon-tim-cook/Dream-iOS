import SwiftUI
import TossPayments

struct PaymentView: View {
    let amount: Int
    @State var isPresentedPayment = false
    
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
                image: { 
                    Image(.creditCard)
                        .resizable()
                    },
                title: "신용카드",
                action: {
                    isPresentedPayment = true
                })
            PaymentButton(
                image:  {
                    Image(.moneyBag)
                        .resizable()
                },
                title: "무통장입금",
                action: {
                })
            PaymentButton(
                image:{
                    Image(.passBook)
                        .resizable()
                },
                title: "계좌이체",
                action: {
                })
        }
        .navigationTitle("결제")
        .sheet(isPresented: $isPresentedPayment) {
            TossPaymentsView(
                clientKey: "test_ck_OyL0qZ4G1VODAxdNWDkroWb2MQYg",
                paymentMethod: .카드,
                paymentInfo: DefaultPaymentInfo(
                    amount: Double(amount),
                    orderId: "9lD0azJWxjBY0KOIumGzH",
                    orderName: "스케쥴 \(amount / 100000)시간",
                    customerName: "이석호"
                ),
                isPresented: $isPresentedPayment
            )
            .onSuccess { paymentKey, orderId, amount in
                NavigationUtil.popToRootView()
            }
            .onFail { errorCode, errorMessage, orderId in
                NavigationUtil.popToRootView()
            }
            .onDisappear(perform: {
                NavigationUtil.popToRootView()
            })
        }
    }
}

struct PaymentViewPreView: View {
    var body: some View {
        PaymentView(amount: 100000)
    }
}

@available(iOS 16, macOS 13, *)
#Preview {
    return PaymentViewPreView()
}
