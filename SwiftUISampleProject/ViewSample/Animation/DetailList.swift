//
//  DetailList.swift
//  SwiftUISampleProject
//
//  Created by NanbanTaro on 2025/06/25.
//  
//

import SwiftUI

struct DetailList: View {
    @Environment(NavigationRouter.self) var router

    let list: [NavigationDestination]

    // MARK: - Initialize

    init(_ list: [NavigationDestination]) {
        self.list = list
    }

    // MARK: - body

    var body: some View {
        List(list, id: \.self) { destination in
            Button(destination.rawValue) {
                router.push(destination)
            }
        }
    }
}

#Preview {
    DetailList(NavigationDestination.allCases.filter { $0.isAnimation })
        .environment(NavigationRouter())
}
