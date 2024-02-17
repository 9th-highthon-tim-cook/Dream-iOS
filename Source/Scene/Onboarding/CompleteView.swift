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
                NavigationLink(destination: ContentView()) {
                    Text("시작하기")
                        .foregroundStyle(Color(.neturalBlack))
                        .padding(.vertical, 14)
                        .frame(width: 280)
                        .background(Color(.netural50))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}
