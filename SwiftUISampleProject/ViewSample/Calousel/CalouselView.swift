//
//  CalouselView.swift
//  SwiftUISampleProject
//
//  Created by NanbanTaro on 2024/03/14.
//  
//

import SwiftUI

struct CalouselView: View {
    private let carouselRange = 0..<10
    let contents = [CalouselModel(title: "Title1", message: "Message1"),
                    CalouselModel(title: "Title2", message: "Message2"),
                    CalouselModel(title: "Title3", message: "Message3"),
                    CalouselModel(title: "Title4", message: "Message4"),
                    CalouselModel(title: "Title5", message: "Message5"),
                    CalouselModel(title: "Title6", message: "Message6")]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(self.contents) { content in
                    VStack {
                        Text(content.title)
                        Text(content.message)
                    }
                    .frame(height: 100)
                    .containerRelativeFrame(.horizontal)
                    .background(.red)
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
        .safeAreaPadding(.horizontal, 100)
    }
}

#Preview {
    CalouselView()
}
