import SwiftUI

struct ChatView: View {
    @State var chatEntity: [ChatEntity] = []
    @State var chatText: String = ""
    @State var chatQueue: [ChatEntity] = [
        ChatEntity(message: "안녕하세요", date: "12:22AM", isMine: true),
        ChatEntity(message: "안녕하세요", date: "12:22AM", isMine: false),
        ChatEntity(message: "혹시 몇시가 좋을까요?", date: "12:23AM", isMine: true),
        ChatEntity(message: "1시, 3시 가능합니다.", date: "12:22AM", isMine: false),
        ChatEntity(message: "3시가 좋을 것 같아요", date: "12:25AM", isMine: true),
        ChatEntity(message: "좋아요!", date: "12:25AM", isMine: false)
    ]
    var body: some View {
        VStack(spacing: 5) {
            Spacer()
                .frame(height: 16)
            ForEach(0..<chatQueue.count, id: \.self) { index in
                if chatQueue[index].isMine {
                    HStack(alignment: .bottom, spacing: 10) {
                        Spacer()
                        Text(chatQueue[index].date)
                            .font(.system(size: 9, weight: .medium))
                            .foregroundColor(Color(.netural500))
                        Text(chatQueue[index].message)
                            .font(.system(size: 16, weight: .medium))
                            .padding(.all, 10)
                            .background(Color(.primary100))
                            .cornerRadius(10)
                    }
                    .padding(.trailing, 16)
                }else {
                    HStack(alignment: .bottom, spacing: 10) {
                        Text(chatQueue[index].message)
                            .font(.system(size: 16, weight: .medium))
                            .padding(.all, 10)
                            .background(Color(.netural100))
                            .cornerRadius(10)
                        Text(chatQueue[index].date)
                            .font(.system(size: 9, weight: .medium))
                            .foregroundColor(Color(.netural500))
                        Spacer()
                    }
                    .padding(.leading, 16)
                }
            }
        }
        Spacer()
        HStack {
            Spacer()
                .frame(width: 18)
            Image(.cameraOnRectangle)
                .tint(Color(.primary500))
            Image(systemName: "plus")
                .foregroundColor(Color(.primary500))
            TextField("채팅을 입력해주세요.", text: $chatText)
                .frame(height: 37)
            Image(systemName: "paperplane.fill")
                .foregroundColor(Color(.primary500))
                .buttonWrapper {
                    chatQueue.append(ChatEntity(message: chatText, date: "12:26AM", isMine: true))
                    chatText = ""
                }
                Spacer()
                .frame(width: 16)

        }
        .background(Color(.netural100))
        .cornerRadius(10)
        .padding(.horizontal, 10)

    }
}

struct ChatViewPreView: View {
    var body: some View {
        ChatView(chatText: "")
    }
}

@available(iOS 16, macOS 13, *)
#Preview {
    return ChatViewPreView()
}
