//
//  NavigationRouter.swift
//  SwiftUISampleProject
//
//  Created by NanbanTaro on 2025/06/25.
//  
//

import SwiftUI

/// Navigation遷移クラス
@MainActor
@Observable
final class NavigationRouter {
    /// パス一覧
    var path = [NavigationDestination]()

    // MARK: - Initialize

    init() { }

    // MARK: - Methods

    /// 画面を進む
    /// - Parameter destination: 遷移先
    func push(_ destination: NavigationDestination) {
        path.append(destination)
    }

    /// 1画面戻る
    func pop() {
        path.removeLast()
    }

    /// Topに戻る
    func toRoot() {
        path.removeAll()
    }

    /// 遷移先のViewを取得する
    /// - Parameter destination: 遷移先
    /// - Returns: 遷移先View
    @ViewBuilder
    func destinationView(for destination: NavigationDestination) -> some View {
        switch destination {
        case .animation: DetailList(destination.detailDestinations)
        case .api: DetailList(destination.detailDestinations)
        case .background: DetailList(destination.detailDestinations)
        case .camera: DetailList(destination.detailDestinations)
        case .combine: DetailList(destination.detailDestinations)
        case .gesture: DetailList(destination.detailDestinations)
        case .image: DetailList(destination.detailDestinations)
        case .layout: DetailList(destination.detailDestinations)
        case .scroll: DetailList(destination.detailDestinations)
        case .viewBuilder: DetailList(destination.detailDestinations)
        // Animation
        case .hero: HeroView()
        case .numericText: NumericTextAnimationView()
        case .transition: TwirlTransitionView()
        // API
        case .alamofire: APIView()
        // Background
        case .linearGradient: LinearGradientView()
        // Camera
        case .cameraView: CameraView()
        // Combine
        case .combineText: CombineView()
        // Gesture
        case .absoluteDrag: AbsoluteDragView()
        case .relativeDrag: RelativeDragView()
        // Image
        case .carPlayMusic: CarPlayMusicView()
        // Layout
        case .radialLayout: RadialLayoutView()
        // Scroll
        case .carousel: CarouselView()
        case .scrollButtons: ScrollButtonsSampleView()
        case .scrollTransition: ScrollTransitionView()
        case .scrollVisibility: ScrollVisibilityView()
        case .stretchHeader: StretchyHeaderScrollView()
        case .scrollElementPosition: ScrollElementPositionView()
        // ViewBuilder
        case .sample: SampleViewBuilderView()
        }
    }
}
