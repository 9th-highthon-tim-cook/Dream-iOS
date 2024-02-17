//
//  SelectionView.swift
//  Dream
//
//  Created by Mercen on 2/18/24.
//  Copyright © 2024 com.highthon. All rights reserved.
//

import SwiftUI

struct SelectionView: View {
    
    @ViewBuilder
    func makeButton(type: String, image: Image) -> some View {
        VStack(spacing: 12) {
            image
                .resizable()
                .scaledToFit()
                .frame(width: 90, height: 90)
                .padding(20)
                .background(Color(.netural50))
                .clipShape(RoundedRectangle(cornerRadius: 20))
            Text(type)
                .foregroundStyle(Color(.neturalBlack))
        }
    }
    
    var body: some View {
        VStack {
            Group {
                Text("회원 유형")
                    .foregroundStyle(Color(.primary500))
                +
                Text("을\n선택해주세요")
            }
            .font(.system(size: 22, weight: .bold))
            .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
            HStack(spacing: 16) {
                NavigationLink(destination: CompleteView(type: .student)) {
                    makeButton(type: "학생", image: .init(.student))
                }
                NavigationLink(destination: CompleteView(type: .parent)) {
                    makeButton(type: "학부모", image: .init(.parent))
                }
            }
            .font(.system(size: 24, weight: .bold))
            .padding(.bottom, 50)
            Spacer()
            NavigationLink(destination: MakeProfileView()) {
                Text("멘토로 등록")
                    .underline()
                    .foregroundStyle(Color(.primary500))
                +
                Text("하시겠습니까?")
                    .foregroundStyle(Color(.neturalBlack))
            }
            .font(.system(size: 18, weight: .semibold))
        }
        .padding(16)
        .navigationTitle("")
    }
}
