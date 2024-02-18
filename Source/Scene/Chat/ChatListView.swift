import SwiftUI

struct ChatListView: View {
    let chatListEntity = [
        ChatListEntity(
            profileImage: "https://www.google.com/imgres?imgurl=https%3A%2F%2Fpds.joongang.co.kr%2Fnews%2Fcomponent%2Fhtmlphoto_mmdata%2F202303%2F27%2Ff5dd0d48-5c7a-4caf-861c-04ff58531dc9.jpg&tbnid=-9K53HpDhE29AM&vet=12ahUKEwimwpO81LOEAxU6xjQHHYoIDOgQMygFegQIARBw..i&imgrefurl=https%3A%2F%2Fwww.joongang.co.kr%2Farticle%2F25150266&docid=fV7sxPDlwpui5M&w=2048&h=2812&q=%ED%8E%98%EC%9D%B4%EC%BB%A4&ved=2ahUKEwimwpO81LOEAxU6xjQHHYoIDOgQMygFegQIARBw",
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
