import SwiftUI
import PhotosUI

struct SaleView: View {
    
    @State private var isPresented: Bool = false
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImage: Image?
    
    var body: some View {
        
        VStack {
            ZStack {
                Rectangle()
                    .frame(width: 361, height: 361)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(.netural200), lineWidth: 1)
                            .padding(.top, 16)

                    )
                    .foregroundColor(.white)

                if (selectedItem != nil) {
                    selectedImage?
                        .resizable()
                        .frame(width: 361, height: 361)
                        .cornerRadius(5)
                }else {
                    Image(systemName: "camera.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 53, height: 44)
                        .foregroundColor(Color(.netural100))
                        .background(Color(.white))
                }
            }
            .onTapGesture {
                self.isPresented = true
            }
            .photosPicker(isPresented: $isPresented, selection: $selectedItem, matching: .images
            )
            .onChange(of: selectedItem) {
                Task {
                    if let loaded = try? await selectedItem?.loadTransferable(type: Image.self) {
                        selectedImage = loaded
                    } else {
                        print("Failed")
                    }
                }
            }

            HTTextField(
                title: "제목",
                placeholder: "제목을 입력해주세요",
                text: .constant("")
            )
            .padding(.top, 37)
            HTTextField(
                title: "가격",
                placeholder: "₩ 가격을 입력해주세요.",
                text: .constant("")
            )
            .keyboardType(.numberPad)
            Spacer()
                .frame(maxWidth: 110)
            Button("작성 완료") {
                
            }
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(.white)
            .padding(.vertical, 18)
            .padding(.horizontal, 150)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(.primary500))
            }
        }
        .padding(.horizontal, 16)
        
    }
}

struct SaleViewPreView: View {
    var body: some View {
        SaleView()
    }
}

@available(iOS 16, macOS 13, *)
#Preview {
    return SaleViewPreView()
}


