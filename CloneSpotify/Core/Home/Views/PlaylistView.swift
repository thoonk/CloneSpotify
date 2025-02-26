//
//  PlaylistView.swift
//  CloneSpotify
//
//  Created by ma23001 on 2/26/25.
//

import SwiftUI

struct PlaylistView: View {
    
    var product: Product = .mock
    var user: User = .mock
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 12) {
                    PlaylistHeaderCell(
                        height: 250,
                        title: product.title,
                        subtitle: product.brand ?? "브랜드",
                        imageName: product.thumbnail
                    )
                    
                    PlaylistDescriptionCell(
                        descriptionText: product.description,
                        userName: user.firstName,
                        subheadline: product.category,
                        onAddToPlaylistPressed: {},
                        onDownloadPressed: {},
                        onSharePressed: {},
                        onEllipsisPressed: {},
                        onShufflePressed: {},
                        onPlayPressed: {}
                    )
                    .padding(.horizontal, 16)
                }
            }
        }
    }
}

#Preview {
    PlaylistView()
}
