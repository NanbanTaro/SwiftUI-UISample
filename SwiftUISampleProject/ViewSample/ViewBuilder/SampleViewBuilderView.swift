//
//  SampleViewBuilderView.swift
//  SwiftUISampleProject
//
//  Created by NanbanTaro on 2024/06/01.
//  
//

import SwiftUI

struct SampleViewBuilderView: View {
    var body: some View {
        SampleViewBuilder {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    SampleViewBuilderView()
}

// MARK: - SampleViewBuilder

struct SampleViewBuilder<Content: View>: View {

    @ViewBuilder let content: () -> Content

    // MARK: - body

    var body: some View {
        VStack {
            self.content()
            Text("サブテキスト")
        }
    }
}
