//
//  AdviceModel.swift
//  SwiftUISampleProject
//
//  Created by NanbanTaro on 2024/01/21.
//  
//

import Foundation

struct AdviceModel: Codable {
    let slip: AdviceSlipModel
}

struct AdviceSlipModel: Codable {
    let id: Int
    var advice: String
}
