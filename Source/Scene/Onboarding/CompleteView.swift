//
//  CompleteView.swift
//  Dream
//
//  Created by Mercen on 2/18/24.
//  Copyright © 2024 com.highthon. All rights reserved.
//

import SwiftUI

struct CompleteView: View {
    
    let type: UserType
    @EnvironmentObject var sceneState: SceneState
    
    var body: some View {
        ZStack {
            Image(.firework)
                .resizable()
                .frame(width: 240, height: 240)
                .frame(maxHeight: .infinity, alignment: .bottom)
            VStack(spacing: 17) {
                Group {
                    Text("회원가입 ")
                        .foregroundStyle(Color(.primary500))
                    +
                    Text("완료!")
                }
                .font(.system(size: 25, weight: .bold))
                Text("시작하기")
                    .foregroundStyle(Color(.neturalBlack))
                    .padding(.vertical, 14)
                    .frame(width: 280)
                    .background(Color(.netural50))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .buttonWrapper {
                        sceneState.scene = .home
                    }
            }
        }
        .navigationBarBackButtonHidden()
        .task {
            do {
                var request = try URLRequest(url: "http://192.168.10.147:3034/user/signup", method: .post)
                let menteeReq = MenteeSIgnupRequest(nickname: "최형우", userId: UserDefaults.standard.string(forKey: "userID")!)
                let json = try JSONEncoder().encode(menteeReq)
                request.httpBody = json
                let (data, res) = try await URLSession.shared.data(for: request)
                print(String(data: data, encoding: .utf8))
                print(res)
            } catch {}
        }
    }
}
