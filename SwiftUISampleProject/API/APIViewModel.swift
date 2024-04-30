//
//  APIViewModel.swift
//  SwiftUISampleProject
//
//  Created by NanbanTaro on 2024/01/21.
//  
//

import Foundation
import Alamofire

class APIViewModel: ObservableObject {

    private let baseUrl = "https://api.adviceslip.com/advice"

    @Published var adiviceText = "アドバイスはありません。"

    func requestRamdomAdvice() async {
        // Automatic String to URL conversion, Swift concurrency support, and automatic retry.
        let response = await AF.request(self.baseUrl, interceptor: .retryPolicy)
//                               // Automatic HTTP Basic Auth.
//                               .authenticate(username: "user", password: "pass")
//                               // Caching customization.
//                               .cacheResponse(using: .cache)
//                               // Redirect customization.
//                               .redirect(using: .follow)
//                               // Validate response code and Content-Type.
//                               .validate()
//                               // Produce a cURL command for the request.
//                               .cURLDescription { description in
//                                 print(description)
//                               }
                               // Automatic Decodable support with background parsing.
                               .serializingDecodable(AdviceModel.self)
                               // Await the full response with metrics and a parsed body.
                               .response

        let updateText: String
        switch response.result {
        case .success(let model):
            updateText = model.slip.advice
        case .failure(let error):
            updateText = error.localizedDescription
        }
        DispatchQueue.main.async {
            self.adiviceText = updateText
        }
    }
}
