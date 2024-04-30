//
//  AdviceModel.swift
//  SwiftUISampleProject
//
//  Created by NanbanTaro on 2024/01/21.
//  
//

import Foundation

class AdviceModel: Codable {
    let slip: AdviceSlipModel
}

class AdviceSlipModel: Codable {
    let id: Int
    var advice: String
}
