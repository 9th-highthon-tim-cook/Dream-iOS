//
//  MyPagePropertyView.swift
//  Dream
//
//  Created by Mercen on 2/18/24.
//  Copyright © 2024 com.highthon. All rights reserved.
//

import SwiftUI

struct MyPagePropertyView: View {
    let title: String
    let data: [CellData]
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.system(size: 20, weight: .bold))
                .padding(.leading, 31)
            ScrollView(.horizontal) {
                HStack(spacing: 12) {
                    ForEach(data, id: \.self) { data in
                        VStack(spacing: 0) {
                            AsyncImage(url: data.thumbnail) { image in
                                image
                                    .resizable()
                            } placeholder: {
                                Color.gray
                            }
                            .scaledToFill()
                            .frame(width: 150, height: 108)
                            .clipped()
                            HStack {
                                Text(data.title)
                                    .font(.system(size: 11, weight: .bold))
                                Spacer()
                                Text(data.type.mentorType)
                                    .font(.system(size: 8, weight: .bold))
                                    .padding(.horizontal, 6)
                                    .padding(.vertical, 2)
                                    .background(data.type == .mentor ? .green : .yellow) // TODO: Change to ???
                                    .clipShape(Capsule())
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 6)
                            .background(Color("netural50"))
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                .padding(.horizontal, 31)
            }
        }
    }
}
