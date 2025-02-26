//
//  StretchyHeaderViewModifier.swift
//  CloneSpotify
//
//  Created by ma23001 on 2/26/25.
//

import SwiftUI

struct StretchyHeaderViewModifier: ViewModifier {
    let height: CGFloat
    
    func body(content: Content) -> some View {
        GeometryReader { geometry in
            content
                .frame(width: geometry.size.width, height: stretchedHeight(geometry))
                .clipped()
                .offset(y: stretchedOffset(geometry))
        }
        .frame(height: height)
    }
    
    private func stretchedHeight(_ geometry: GeometryProxy) -> CGFloat {
        let offset = geometry.frame(in: .global).minY
        return offset > 0 ? (height + offset) : height
    }
    
    private func stretchedOffset(_ geometry: GeometryProxy) -> CGFloat {
        let offset = geometry.frame(in: .global).minY
        return offset > 0 ? -offset : 0
    }
}

extension View {
    func stretchyHeader(height: CGFloat) -> some View {
        self.modifier(StretchyHeaderViewModifier(height: height))
    }
}
