//
//  CarPlayMusicView.swift
//  SwiftUISampleProject
//
//  Created by NanbanTaro on 2024/05/01.
//  
//

import SwiftUI

struct CarPlayMusicView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(.sakura)
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
                    .blur(radius: 16, opaque: true)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                HStack(spacing: 20) {
                    Image(.sakura)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width / 4,
                               height: geometry.size.width / 4)
                        .clipped()
                        .shadow(radius: 4)
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Sakura")
                        Text("2024/01/01")
                    }
                }
            }
        }
    }
}

#Preview {
    CarPlayMusicView()
}
