//
//  PressEffectViewModifier.swift
//  CloneSpotify
//
//  Created by ma23001 on 2/26/25.
//

import SwiftUI

struct PressEffectViewModifier: ViewModifier {
    var onPress: () -> Void
    @State private var isPressed = false
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(isPressed ? 0.95 : 1.0)
            .brightness(isPressed ? -0.05 : 0)
            .animation(.easeInOut(duration: 0.1), value: isPressed)
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { _ in isPressed = true }
                    .onEnded { _ in
                        isPressed = false
                        onPress()
                    }
            )
    }
}

extension View {
    func withPressableAnimation(onPress: @escaping () -> Void) -> some View {
        modifier(PressEffectViewModifier(onPress: onPress))
    }
}
