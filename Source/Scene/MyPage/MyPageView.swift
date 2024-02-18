//
//  MyPageView.swift
//  Dream
//
//  Created by Mercen on 2/18/24.
//  Copyright © 2024 com.highthon. All rights reserved.
//

import SwiftUI

enum UserType: String, Codable {
    case mentor = "MENTOR"
    case student = "STUDENT"
    case parent = "PARENT"
    var mentorType: String {
        switch self {
        case .mentor: "멘토"
        default: "멘티"
        }
    }
}

struct CellData: Codable, Hashable {
    let thumbnail: URL
    let title: String
    let type: UserType
}

struct MyPageView: View {
    @State var onProgressData: [CellData] = [.init(thumbnail: URL(string: "https://avatars.githubusercontent.com/u/74440939?v=4")!, title: "샘플", type: .mentor)]
    @State var completedData: [CellData] = [.init(thumbnail: URL(string: "https://avatars.githubusercontent.com/u/74440939?v=4")!, title: "샘플", type: .mentor)]
    var body: some View {
        ScrollView {
            VStack(spacing: 35) {
                VStack(spacing: 8) {
                    ZStack(alignment: .bottom) {
                        Rectangle()
                            .fill(Color(.netural200))
                            .frame(height: 180)
                            .padding(.bottom, 44.5)
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .frame(width: 89, height: 89)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color(.netural500))
                    }
                    HStack(spacing: 2.3) {
                        Text("13팀")
                            .font(.system(size: 27, weight: .bold))
                        Image(systemName: "checkmark.seal.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(Color.white, Color.accentColor)
                    }
                }

                Divider()
                    .frame(height: 1)
                    .background(Color(.netural300))
                    .padding(.horizontal, 16)
                MyPagePropertyView(title: "진행 중인 상담", data: onProgressData)
                MyPagePropertyView(title: "완료한 상담", data: completedData)
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct MyPagePreView: View {
    var body: some View {
        MyPageView()
    }
}

@available(iOS 16, macOS 13, *)
#Preview {
    return MyPagePreView()
}
