//
//  APIView.swift
//  SwiftUISampleProject
//
//  Created by NanbanTaro on 2024/01/21.
//  
//

import SwiftUI

struct APIView: View {
    @State var vm = APIViewModel()
    
    // MARK: - body

    var body: some View {
        Button("アドバイスを取得する") {
            Task.detached {
                await self.vm.requestRandomAdvice()
            }
        }
        Text(self.vm.adviceText)
    }
}

#Preview {
    APIView()
}
