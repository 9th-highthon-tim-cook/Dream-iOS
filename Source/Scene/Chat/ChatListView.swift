import SwiftUI

struct ChatListView: View {
    let chatListEntity = [
        ChatListEntity(
            profileImage: "https://avatars.githubusercontent.com/u/74440939?v=4",
            name: "이상혁",
            isCheck: true,
            isMenti: true,
            postDate: "2일전",
            detailText: "나: 감사합니다"
        )
        ]
        @State var chatEntity: ChatListEntity?
    
    var body: some View {
        VStack() {
            HStack {
                Spacer()
                    .frame(width: 23)
                Text("전체채팅")
                    .font(.system(size: 30, weight: .bold))
                Spacer()
            }
            LazyVStack {
                ForEach(chatListEntity, id: \.self) { chatList in
                    HStack(alignment: .center, spacing: 2) {
                        Spacer().frame(width: 20)
                        AsyncImage(url: URL(string: chatList.profileImage)) { image in
                            image.resizable()
                                .frame(maxWidth: 63, maxHeight: 63)
                                .clipShape(Circle())
                        } placeholder: {
                            EmptyView()
                        }
                            
                        Spacer()
                            .frame(width: 10)
                        HStack(alignment: .center) {
                            VStack(alignment: .leading) {
                                HStack(alignment: .center) {
                                    Text(chatList.name)
                                        .font(.system(size: 18, weight: .bold))
                                    if chatList.isCheck {
                                        Image(systemName: "checkmark.seal.fill")
                                            .foregroundColor(Color(.primary500))
                                            .frame(maxWidth: 17, maxHeight: 17)
                                    }
                                    Spacer()
                                        .frame(width: 6)
                                    if chatList.isMenti {
                                        Text("멘토")
                                            .frame(width: 31, height: 20)
                                            .font(.system(size: 10, weight: .bold))
                                            .background(Color(.gg))
                                            .cornerRadius(20)
                                    }
                                    Spacer()
                                        .frame(width: 24)
                                    Text(chatList.postDate)
                                        .font(.system(size: 12, weight: .bold))
                                        .foregroundColor(Color(.netural500))
                                }
                                

                                Text(chatList.detailText)
                                    .font(.system(size: 10, weight: .bold))
                                    .foregroundColor(Color(.netural500))
                            }
                          
                            Spacer()
                        }
                    }
                    .buttonWrapper {
                        chatEntity = chatList
                    }
                }
            }
            .navigationDestination(item: $chatEntity) { chat in
                ChatView()
            }
            Spacer()
        }
        
    }
}
