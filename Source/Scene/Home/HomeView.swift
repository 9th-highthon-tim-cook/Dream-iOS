import SwiftUI

struct HomeView: View {
    @State var mentorTimeList: [MentorTimeEntity] = [
        .init(title: "개발자의 시간을 팝니다", auhtor: "니콜라스", imageURL: "https://avatars.githubusercontent.com/u/74440939?v=4", date: "asdf", price: 112)
    ]

    var body: some View {
        VStack(spacing: 16) {
            ScrollView(.horizontal) {
                LazyHStack(spacing: 8) {
                    categoryButton(title: "직종") {
                        Image(systemName: "suitcase.fill")
                    } onTap: {
                        
                    }

                    categoryButton(title: "날짜") {
                        Image(systemName: "calendar")
                    } onTap: {
                        
                    }

                    categoryButton(title: "시간") {
                        Image(systemName: "clock.fill")
                    } onTap: {
                        
                    }

                    categoryButton(title: "가격대") {
                        Image(systemName: "wonsign.square.fill")
                    } onTap: {
                        
                    }
                }
            }
            .scrollIndicators(.hidden)
            .frame(height: 50)
            .padding(.top, 16)

            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(mentorTimeList, id: \.self) { mentorTime in
                        VStack {
                            mentorTimeRow(mentorTime: mentorTime)

                            Divider()
                        }
                        .padding(.horizontal, 16)
                    }
                }
            }

            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Image(.timeMarketLogo)
            }

            ToolbarItem(placement: .topBarTrailing) {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(Color(.neturalBlack))
            }
        }
    }

    @ViewBuilder
    func categoryButton(
        title: String,
        @ViewBuilder icon: () -> some View,
        onTap: @escaping () -> Void
    ) -> some View {
        HStack(spacing: 6) {
            icon()

            Text(title)
                .font(.system(size: 14, weight: .medium))
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 11)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.netural50))
        }
    }

    @ViewBuilder
    func mentorTimeRow(mentorTime: MentorTimeEntity) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(mentorTime.title)
                    .font(.system(size: 16, weight: .medium))

                Text("\(mentorTime.auhtor) · \(mentorTime.date)")
                    .font(.system(size: 13, weight: .medium))
                    .foregroundStyle(Color(.netural500))

                Text("\(mentorTime.price)원/시간")
                    .font(.system(size: 16, weight: .bold))
            }

            Spacer()

            if let imageURL = mentorTime.imageURL {
                AsyncImage(url: URL(string: imageURL)) { image in
                    image.resizable()
                        .frame(width: 109, height: 109)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                } placeholder: {
                    Color.gray
                        .frame(width: 109, height: 109)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                }
            }
        }
    }
}
