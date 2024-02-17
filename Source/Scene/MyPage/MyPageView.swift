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
    @State var onProgressData: [CellData] = [.init(thumbnail: URL(string: "https://nater.com/nater_riding.jpg")!, title: "샘플", type: .mentor)]
    @State var completedData: [CellData] = [.init(thumbnail: URL(string: "https://nater.com/nater_riding.jpg")!, title: "샘플", type: .mentor)]
    var body: some View {
        ScrollView {
            VStack(spacing: 35) {
                VStack(spacing: 8) {
                    ZStack(alignment: .bottom) {
                        Rectangle()
                            .fill(Color.red)
                            .frame(height: 143)
                            .padding(.bottom, 44.5)
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 89, height: 89)
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
                MyPagePropertyView(title: "진행 중인 상담", data: onProgressData)
                MyPagePropertyView(title: "완료한 상담", data: completedData)
            }
        }
    }
}
