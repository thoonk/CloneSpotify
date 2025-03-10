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

enum InteractionType {
    case press, fade, tap
}

struct InteractiveButtonStyle: ButtonStyle {
    
    let scale: CGFloat
    let opacity: Double
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scale : 1)
            .opacity(configuration.isPressed ? opacity : 1)
    }
}

extension View {
    func applyTouchEffect(
        scale: CGFloat = 0.95,
        opacity: Double = 1,
        action: @escaping () -> Void) -> some View {
            Button(action: {
                action()
            }, label: {
                self
            })
            .buttonStyle(InteractiveButtonStyle(scale: scale, opacity: opacity))
        }
    
    @ViewBuilder
    func interactiveButton(
        _ style: InteractionType = .tap,
        action: @escaping () -> Void
    ) -> some View {
        switch style {
        case .press:
            self.applyTouchEffect(scale: 0.975, action: action)
        case .fade:
            self.applyTouchEffect(scale: 1, opacity: 0.85, action: action)
        case .tap:
            self.onTapGesture {
                action()
            }
        }
    }
}
