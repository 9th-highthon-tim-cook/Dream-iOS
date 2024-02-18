import SwiftUI

struct HomeView: View {
    @State var mentorTimeList: [MentorTimeEntity] = []
    @State var selectedMentorTime: MentorTimeEntity?

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
                .padding(.horizontal, 16)
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
                        .buttonWrapper {
                            selectedMentorTime = mentorTime
                        }
                    }
                }
            }

            Spacer()
        }
        .task {
            do {
                var request = URLRequest(url: URL(string: "http://192.168.10.147:3034/post/list")!)
                let access = UserDefaults.standard.string(forKey: "accessToken")!
                request.addValue(access, forHTTPHeaderField: "Authorization")
                let (data, response) = try await URLSession.shared.data(for: request)
                print(String(data: data, encoding: .utf8), response)
                let json = try JSONDecoder().decode([PostListResponse].self, from: data)
                self.mentorTimeList = json.map { $0.toDomain() }
            } catch {}
        }
        .navigationDestination(item: $selectedMentorTime) { mentorTime in
            HomeDetailView(
                detailEntity: .init(
                    detailImageURL: "https://avatars.githubusercontent.com/u/74440939?v=4",
                    profileImageURL: "https://avatars.githubusercontent.com/u/74440939?v=4",
                    name: "baekteun",
                    job: "iOS Engineer",
                    title: "baekteun",
                    postTime: "100000",
                    text: "안녕하세요. iOS 개발 1인분은 할 수 있게 해드립니다",
                    amount: "100000",
                    isCheck: true
                )
            )
            .toolbar(.hidden, for: .tabBar)
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
