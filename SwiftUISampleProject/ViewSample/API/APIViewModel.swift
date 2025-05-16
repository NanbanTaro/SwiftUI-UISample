//
//  APIViewModel.swift
//  SwiftUISampleProject
//
//  Created by NanbanTaro on 2024/01/21.
//  
//

import Foundation
import Alamofire

@MainActor
@Observable
final class APIViewModel {
    /// アドバイステキスト
    var adviceText = "アドバイスはありません。"
    var isLoading = false

    private let repository: AdviceRepositoryProtocol

    // MARK: - Initializer

    init(repository: AdviceRepositoryProtocol = AdviceRepository()) {
        self.repository = repository
    }

    // MARK: - Methods

    func requestRandomAdvice() async {
        let text = await repository.request()
        adviceText = text
    }
}

protocol AdviceRepositoryProtocol {
    func request() async -> String
}

final class AdviceRepository: AdviceRepositoryProtocol {
    /// ベースURL
    private let baseUrl = "https://api.adviceslip.com/advice"

    // MARK: - Methods

    func request() async -> String {
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

        switch response.result {
        case .success(let model):
            return model.slip.advice
        case .failure(let error):
            return error.localizedDescription
        }
    }
}
