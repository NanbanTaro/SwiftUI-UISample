//
//  SampleListView.swift
//  SwiftUISampleProject
//
//  Created by NanbanTaro on 2023/12/10.
//  
//

import SwiftUI

struct SampleListView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("API") {
                    APIView()
                }
                NavigationLink("背景") {
                    BackgroundView()
                }
                NavigationLink("カルーセル") {
                    CarouselView()
                }
                NavigationLink("カメラ(調整中)") {
                    CameraView()
                }
                NavigationLink("テキストバリデーション(Combine)") {
                    CombineView()
                }
                NavigationLink("イメージ") {
                    ImageView()
                }
                NavigationLink("Layout") {
                    LayoutView()
                }
                NavigationLink("ViewBuilder") {
                    SampleViewBuilderView()
                }
            }
            .navigationTitle("サンプル一覧")
        }
    }
}

#Preview {
    SampleListView()
}
