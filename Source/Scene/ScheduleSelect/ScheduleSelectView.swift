import SwiftUI

struct ScheduleSelectView: View {
    let date: Date
    @State var scheduleList: [ScheduleEntity] = [
        .init(id: "1", date: "2월 19일 (월)", time: 9),
        .init(id: "2", date: "2월 19일 (월)", time: 10)
    ]
    @State var selectedSchedule = Set<String>()
    @State var isNavigatePayment = false

    init(date: Date) {
        self.date = date
    }

    var body: some View {
        let dateString = "\(date.year).\(date.month).\(date.day)."
        VStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(scheduleList, id: \.self) { schedule in
                        VStack(alignment: .leading, spacing: 4) {
                            HStack {
                                Text(schedule.date)
                                    .font(.system(size: 20, weight: .bold))

                                Spacer()

                                if selectedSchedule.contains(schedule.id) {
                                    Image(systemName: "checkmark.circle.fill")
                                        .resizable()
                                        .foregroundStyle(Color(.primary500))
                                        .frame(width: 22, height: 22)
                                } else {
                                    Circle()
                                        .stroke(Color(.netural300), lineWidth: 1)
                                        .frame(width: 22, height: 22)
                                }
                            }

                            Text("\(schedule.time)시 ~ \(schedule.time + 1)시")
                                .font(.system(size: 16, weight: .medium))

                            HStack {
                                Spacer()

                                Text("100000원")
                                    .font(.system(size: 16, weight: .bold))
                            }
                            .padding(.top, 24)
                        }
                        .padding(.vertical, 20)
                        .padding(.horizontal, 16)
                        .background {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(.netural50))
                        }
                        .buttonWrapper {
                            if selectedSchedule.contains(schedule.id) {
                                selectedSchedule.remove(schedule.id)
                            } else {
                                selectedSchedule.insert(schedule.id)
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                }
            }

            Divider()

            HStack {
                Text("총 결제금액 (\(selectedSchedule.count)개)")

                Spacer()

                Text("\(selectedSchedule.count * 100000)원")
            }
            .font(.system(size: 20, weight: .bold))
            .padding(.horizontal, 16)

            Text("결제하기")
                .font(.system(size: 16, weight: .bold))
                .padding(.vertical, 14)
                .frame(maxWidth: .infinity)
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color(.primary500))
                }
                .buttonWrapper {
                    isNavigatePayment = true
                }
                .padding(.horizontal, 16)
                .padding(.top, 24)
        }
        .navigationTitle(dateString)
        .navigationDestination(isPresented: $isNavigatePayment) {
            PaymentView(amount: selectedSchedule.count * 100000)
        }
    }
}
