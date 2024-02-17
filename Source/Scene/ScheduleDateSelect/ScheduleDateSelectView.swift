import SwiftUI

struct ScheduleDateSelectView: View {
    @State var date = Date()
    @State var isNavigateSchedule = false

    var body: some View {
        VStack {
            DatePicker("", selection: $date, displayedComponents: [.date])
                .datePickerStyle(.graphical)
        }
        .navigationTitle("스케쥴 선택하기")
        .onChange(of: date) { oldValue, newValue in
            isNavigateSchedule = true
        }
        .navigationDestination(isPresented: $isNavigateSchedule) {
            ScheduleSelectView(date: date)
        }
    }
}

#Preview {
    ScheduleDateSelectView()
}
