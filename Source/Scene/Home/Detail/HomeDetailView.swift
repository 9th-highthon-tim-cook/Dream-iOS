import SwiftUI

struct HomeDetailView: View {
    let detailEntity: DetailEntity
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Image(.faker1)
                    .resizable()
                    .frame(height: 393)
                HStack(spacing: 8) {
                    ZStack {
                        Image(detailEntity.postTime)
                            .frame(width: 49, height: 49)
                            .cornerRadius(49/2)
                        Image(.check)
                            .padding(.horizontal, 31)
                    }
                    .padding(.leading, 16)
                    VStack(alignment: .leading, spacing: 7) {
                        Text(detailEntity.name)
                            .font(.system(size: 16, weight: .bold))
                        Text(detailEntity.job)
                            .font(.system(size: 13, weight: .medium))
                            .foregroundColor(Color(.netural500))
                    }
                }
                .padding(.top, 16)
                Divider()
                    .frame(height: 1)
                    .padding(.horizontal, 16)
                    .foregroundColor(Color(.netural100))
                    .padding(.top, 16)
                Group {
                    Text(detailEntity.title)
                        .padding(.top, 25)
                        .font(.system(size: 20, weight: .bold))
                    Text(detailEntity.postTime)
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(Color(.netural500))
                        .padding(.top, 11)
                    Text(detailEntity.text)
                        .padding(.top, 25)
                        .font(.system(size: 16, weight: .medium))

                }
                .padding(.horizontal, 16)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        VStack(spacing: 5) {
            Divider()
                .frame(height: 1)
                .padding(.horizontal, 16)
                .foregroundColor(Color(.netural100))
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("시간당")
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(Color(.netural500))
                    Text(detailEntity.amount)
                        .font(.system(size: 16, weight: .bold))
                    +
                    Text("원")
                        .font(.system(size: 16, weight: .bold))
                }
                Spacer()
                Button("구매하기") {
                    
                }
                .frame(width: 177, height: 56)
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.white)
                .background(Color(.primary500))
                .cornerRadius(10)
                
            }
            .padding(.horizontal, 16)
            
        }
        .padding(.bottom, 16)
//        .background(Color.black)
    }

}

struct HomeDetailViewPreView: View {
    var body: some View {
        HomeDetailView(detailEntity: DetailEntity.init(
            detailImage: Image(.faker),
            profileImage: "",
            name: "이상혁",
            job: "프로게이머",
            title: "페이커의 시간을 구합니다",
            postTime: "2시간 전",
            text: "어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구",
            amount: "300,000"
        ))
    }
}

@available(iOS 16, macOS 13, *)
#Preview {
    return HomeDetailViewPreView()
}
