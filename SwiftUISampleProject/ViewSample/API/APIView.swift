//
//  APIView.swift
//  SwiftUISampleProject
//
//  Created by NanbanTaro on 2024/01/21.
//  
//

import SwiftUI

struct APIView: View {
    @State private var vm = APIViewModel()

    // MARK: - body

    var body: some View {
        ZStack {
            VStack {
                Button("アドバイスを取得する") {
                    Task {
                        await self.vm.getRandomAdvice()
                    }
                }
                Text(self.vm.adviceText)
            }

            ProgressView()
                .progressViewStyle(.circular)
                .opacity(vm.isLoading ? 1 : 0)
        }
    }
}

#Preview {
    APIView()
}
