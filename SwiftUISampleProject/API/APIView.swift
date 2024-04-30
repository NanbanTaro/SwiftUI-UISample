//
//  APIView.swift
//  SwiftUISampleProject
//
//  Created by NanbanTaro on 2024/01/21.
//  
//

import SwiftUI

struct APIView: View {

    @ObservedObject var vm = APIViewModel()

    var body: some View {
        Button("アドバイスを取得する") {
            Task.detached {
                await self.vm.requestRamdomAdvice()
            }
        }
        Text(self.vm.adiviceText)
    }
}

#Preview {
    APIView()
}
