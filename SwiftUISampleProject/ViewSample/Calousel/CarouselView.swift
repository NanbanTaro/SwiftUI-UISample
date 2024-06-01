//
//  CarouselView.swift
//  SwiftUISampleProject
//
//  Created by NanbanTaro on 2024/03/14.
//  
//

import SwiftUI

struct CarouselView: View {
    private let carouselRange = 0..<10
    let contents = [CarouselModel(title: "Title1", message: "Message1"),
                    CarouselModel(title: "Title2", message: "Message2"),
                    CarouselModel(title: "Title3", message: "Message3"),
                    CarouselModel(title: "Title4", message: "Message4"),
                    CarouselModel(title: "Title5", message: "Message5"),
                    CarouselModel(title: "Title6", message: "Message6")]

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
    CarouselView()
}
