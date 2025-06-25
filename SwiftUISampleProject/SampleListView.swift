//
//  SampleListView.swift
//  SwiftUISampleProject
//
//  Created by NanbanTaro on 2023/12/10.
//  
//

import SwiftUI

struct SampleListView: View {
    @State private var router = NavigationRouter()

    var body: some View {
        NavigationStack(path: $router.path) {
            let list = NavigationDestination.allCases.filter { $0.isHome }
            List(list, id: \.self) { destination in
                Button(destination.rawValue) {
                    router.push(destination)
                }
            }
            .navigationDestination(for: NavigationDestination.self) { destination in router.destinationView(for: destination)
                    .environment(router)
            }
            .navigationTitle("サンプル一覧")
        }
    }
}

#Preview {
    SampleListView()
}
