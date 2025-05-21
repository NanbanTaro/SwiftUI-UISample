//
//  Fruits.swift
//  SwiftUISampleProject
//
//  Created by NanbanTaro on 2025/05/22.
//  
//

/// フルーツ
enum Fruits: ScrollButtonTypes {
    case apple
    case banana
    case orange
    case grape
    case pineapple

    var name: String {
        String(describing: self).uppercased()
    }

    /// アイコン
    var icon: String {
        switch self {
        case .apple: "🍎"
        case .banana: "🍌"
        case .orange: "🍊"
        case .grape: "🍇"
        case .pineapple: "🍍"
        }
    }
}
