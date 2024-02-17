import SwiftUI

public struct HTTextField: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    var isDisabled: Bool
    var isSecure: Bool

    public init(
        title: String = "",
        placeholder: String = "",
        text: Binding<String>,
        isDisabled: Bool = false,
        isSecure: Bool = false
    ) {
        self.title = title
        self.placeholder = placeholder
        self._text = text
        self.isDisabled = isDisabled
        self.isSecure = isSecure
    }
    public var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            if !title.isEmpty {
                Text(title)
                    .font(.system(size: 14, weight: .bold))
                    .padding(.bottom, 4)
            }
            if !isSecure {
                TextField(placeholder, text: $text)
                    .modifier(HTTextFieldModifier(
                        text: text,
                        isDisabled: isDisabled,
                        borderColor: Color(.netural200)
                    ))
            } else {
                SecureField(placeholder, text: $text)
                    .modifier(HTTextFieldModifier(
                        text: text,
                        isDisabled: isDisabled,
                        borderColor: Color(.netural200)
                    ))
            }
        }
        .padding(.bottom, 25)
    }
}

struct HTTextFieldModifier: ViewModifier {
    
    @FocusState private var isFocusing: Bool
    
    var text: String
    var isDisabled: Bool
    var borderColor: Color
    
    func body(content: Content) -> some View {
            content
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .frame(height: 50, alignment: .center)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
                .background(.white)
                .cornerRadius(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(borderColor, lineWidth: 1)
                )
                .font(.system(
                    size: 16,
                    weight: .regular
                ))
                .disabled(isDisabled)
                .focused($isFocusing)
        }
}

struct HTTextFieldPreView: View {
    @Binding var text: String
    var body: some View {
        HTTextField(
            title: "직종",
            placeholder: "직종을 입력해주세요",
            text: $text
        )
        .padding(.horizontal, 20)
    }
}

@available(iOS 16, macOS 13, *)
#Preview {

    return HTTextFieldPreView(text: .constant(""))
    
}
