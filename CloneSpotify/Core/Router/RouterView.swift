//
//  RouterView.swift
//  CloneSpotify
//
//  Created by ma23001 on 2/27/25.
//

import SwiftUI

struct RouterView<Content: View>: View {
    @StateObject var router: Router = .init()
    
    private let content: Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationStack(path: $router.path) {
            content.navigationDestination(for: Router.Route.self) { route in
                router.view(for: route)
            }
        }
        .environmentObject(router)
    }
}
