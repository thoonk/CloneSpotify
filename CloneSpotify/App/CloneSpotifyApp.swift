//
//  CloneSpotifyApp.swift
//  CloneSpotify
//
//  Created by ma23001 on 2/24/25.
//

import SwiftUI

@main
struct CloneSpotifyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

extension UINavigationController: @retroactive UIGestureRecognizerDelegate {
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
