//
//  Router.swift
//  CloneSpotify
//
//  Created by ma23001 on 2/27/25.
//

import SwiftUI

class Router: ObservableObject {
    enum Route: Hashable {
        case home
        case playlist(Product, User)
        
        func hash(into hasher: inout Hasher) {
            switch self {
            case .home:
                hasher.combine(0)
            case .playlist(let product, let user):
                hasher.combine(1)
                hasher.combine(product.id)
                hasher.combine(user.id)
            }
        }
        
        static func == (lhs: Route, rhs: Route) -> Bool {
            switch (lhs, rhs) {
            case (.home, .home):
                return true
            case (.playlist(let lhsProduct, let lhsUser), .playlist(let rhsProduct, let rhsUser)):
                return lhsProduct.id == rhsProduct.id && lhsUser.id == rhsUser.id
            default:
                return false
            }
        }
    }
    
    @Published var path: NavigationPath = .init()
    
    @ViewBuilder func view(for route: Route) -> some View {
        switch route {
        case .home:
            HomeView()
        case .playlist(let product, let user):
            PlaylistView(product: product, user: user)
        }
    }
    
    func navigateTo(_ appRoute: Route) {
        path.append(appRoute)
    }
    
    func navigateBack() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
}

