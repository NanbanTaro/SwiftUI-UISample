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
                NavigationLink("カメラ") {
                    CameraView()
                }
                NavigationLink("API") {
                    APIView()
                }
                NavigationLink("カルーセル") {
                    CalouselView()
                }
            }
        }
    }
}

#Preview {
    SampleListView()
}
