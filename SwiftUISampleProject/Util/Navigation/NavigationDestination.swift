//
//  NavigationDestination.swift
//  SwiftUISampleProject
//
//  Created by NanbanTaro on 2025/06/25.
//  
//

import Foundation

/// Navigation遷移先
enum NavigationDestination: String, Hashable, CaseIterable {
    // MARK: Home
    case animation
    case api
    case background
    case camera
    case combine
    case gesture
    case image
    case layout
    case scroll
    case viewBuilder

    /// ホーム表示されるものか
    var isHome: Bool {
        switch self {
        case .animation: true
        case .api: true
        case .background: true
        case .camera: true
        case .combine: true
        case .gesture: true
        case .image: true
        case .layout: true
        case .scroll: true
        case .viewBuilder: true
        default: false
        }
    }

    /// 子Viewに表示される遷移先
    var detailDestinations: [NavigationDestination] {
        let list: [NavigationDestination]? = switch self {
        case .animation: NavigationDestination.allCases.filter { $0.isAnimation }
        case .api: NavigationDestination.allCases.filter { $0.isApi }
        case .background: NavigationDestination.allCases.filter { $0.isBackground }
        case .camera: NavigationDestination.allCases.filter { $0.isCamera }
        case .combine: NavigationDestination.allCases.filter { $0.isCombine }
        case .gesture: NavigationDestination.allCases.filter { $0.isGesture }
        case .image: NavigationDestination.allCases.filter { $0.isImage }
        case .layout: NavigationDestination.allCases.filter { $0.isLayout }
        case .scroll: NavigationDestination.allCases.filter { $0.isScroll }
        case .viewBuilder: NavigationDestination.allCases.filter { $0.isViewBuilder }
        default: nil
        }

        guard let list = list else {
            fatalError("存在しない画面")
        }

        return list
    }

    // MARK: Animation
    case hero
    case numericText
    case transition

    /// Animationに関連する遷移先か
    var isAnimation: Bool {
        switch self {
        case .hero: true
        case .numericText: true
        case .transition: true
        default: false
        }
    }

    // MARK: API
    case alamofire

    /// APIに関連する遷移先か
    var isApi: Bool {
        switch self {
        case .alamofire: true
        default: false
        }
    }

    // MARK: Background
    case linearGradient

    /// 背景に関連する遷移先か
    var isBackground: Bool {
        switch self {
        case .linearGradient: true
        default: false
        }
    }

    // MARK: Camera
    case cameraView

    /// カメラに関連する遷移先か
    var isCamera: Bool {
        switch self {
        case .cameraView: true
        default: false
        }
    }

    // MARK: Combine
    case combineText

    /// Combineに関連する遷移先か
    var isCombine: Bool {
        switch self {
        case .combineText: true
        default: false
        }
    }

    // MARK: Gesture
    case absoluteDrag
    case relativeDrag

    /// Gestureに関連する遷移先か
    var isGesture: Bool {
        switch self {
        case .absoluteDrag: true
        case .relativeDrag: true
        default: false
        }
    }

    // MARK: Image
    case carPlayMusic

    /// 画像に関連する遷移先か
    var isImage: Bool {
        switch self {
        case .carPlayMusic: true
        default: false
        }
    }

    // MARK: Layout
    case radialLayout

    /// レイアウトに関連する遷移先か
    var isLayout: Bool {
        switch self {
        case .radialLayout: true
        default: false
        }
    }

    // MARK: Scroll
    case carousel
    case scrollButtons
    case scrollElementPosition
    case scrollTransition
    case scrollVisibility
    case stretchHeader

    /// スクロールに関連する遷移先か
    var isScroll: Bool {
        switch self {
        case .carousel: true
        case .scrollButtons: true
        case .scrollElementPosition: true
        case .scrollTransition: true
        case .scrollVisibility: true
        case .stretchHeader: true
        default: false
        }
    }

    // MARK: ViewBuilder
    case sample

    /// ViewBuilderに関する遷移先か
    var isViewBuilder: Bool {
        switch self {
        case .sample: true
        default: false
        }
    }
}
