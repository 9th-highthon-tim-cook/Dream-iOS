//
//  MakeProfileView.swift
//  Dream
//
//  Created by Mercen on 2/18/24.
//  Copyright © 2024 com.highthon. All rights reserved.
//

import SwiftUI

struct MakeProfileView: View {
    
    @State var businessType: String = ""
    @State var introduce: String = ""
    @State var business: String = ""
    @State var salary: Int = 0
    @State var years: String = ""
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack(spacing: 16) {
                    HTTextField(title: "직종", placeholder: "직종을 입력해주세요.", text: $businessType)
                    HTTextField(title: "소개", placeholder: "짧은 소개를 입력해주세요.", text: $introduce)
                    HTTextField(title: "직장", placeholder: "직장을 입력해주세요(선택).", text: $business)
                    HTTextField(title: "연봉", placeholder: "연봉을 입력해주세요(선택).", text:
                                    Binding(get: { "\(salary)" },
                                            set: {
                        var result = ""
                        for char in $0 {
                            if char.isNumber {
                                result.append(char)
                            }
                        }
                        salary = Int(result) ?? 0
                    }))
                    .keyboardType(.numberPad)
                    HTTextField(title: "경력", placeholder: "경력을 입력해주세요(선택).", text: $years)
                }
                .padding(16)
            }
            NavigationLink(destination: CompleteView(type: .mentor)) {
                Text("완료")
                    .foregroundStyle(Color(.neturalWhite))
                    .padding(.vertical, 18)
                    .frame(maxWidth: .infinity)
                    .background(Color(.primary500))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding(16)
        }
        .navigationTitle("프로필 만들기")
    }
}
