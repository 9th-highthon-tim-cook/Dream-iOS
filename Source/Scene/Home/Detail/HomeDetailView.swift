import SwiftUI

struct HomeDetailView: View {
    let detailEntity: DetailEntity
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                if let profile = detailEntity.detailImageURL {
                    AsyncImage(url: URL(string: profile)) { image in
                        image
                            .resizable()
                            .frame(maxWidth: .infinity)
                            .aspectRatio(1, contentMode: .fit)
                            .overlay(alignment: .top) {
                                LinearGradient(colors: [.black.opacity(0.5), .clear], startPoint: .top, endPoint: .bottom)
                            }
                    } placeholder: {
                        EmptyView()
                    }
                }
                    
                HStack(spacing: 8) {
                    AsyncImage(url: URL(string: detailEntity.profileImageURL)) { image in
                        image
                            .resizable()
                            .frame(width: 49, height: 49)
                            .clipShape(Circle())
                            .overlay(alignment: .bottomTrailing) {
                                if detailEntity.isCheck {
                                    Image(.check)
                                }
                            }
                            .padding(.leading, 16)
                    } placeholder: {
                        Circle()
                            .fill(Color.gray)
                            .frame(width: 49, height: 49)
                    }

                    Image(detailEntity.postTime)
                        
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
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.white)
                .padding(.vertical, 18)
                .padding(.horizontal, 60)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(.primary500))
                }
                
            }
            .padding(.horizontal, 16)
            
        }
        .padding(.bottom, 16)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Image(systemName: "chevron.left")
                    .foregroundStyle(.white)
                    .buttonWrapper {
                        dismiss()
                    }
            }
        }
        .navigationBarBackButtonHidden()
    }
    
}

struct HomeDetailViewPreView: View {
    var body: some View {
        HomeDetailView(detailEntity: DetailEntity.init(
            detailImageURL: "https://avatars.githubusercontent.com/u/74440939?v=4",
            profileImageURL: "",
            name: "이상혁",
            job: "프로게이머",
            title: "페이커의 시간을 구합니다",
            postTime: "2시간 전",
            text: "어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구어쩌구저쩌구",
            amount: "300,000",
            isCheck: true
        ))
    }
}

@available(iOS 16, macOS 13, *)
#Preview {
    return HomeDetailViewPreView()
}
