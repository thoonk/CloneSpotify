//
//  FrameObserver.swift
//  CloneSpotify
//
//  Created by ma23001 on 2/27/25.
//

import SwiftUI

struct FrameObserver: View {
    let coordinateSpace: CoordinateSpace
    
    let onFrameChange: (_ frame: CGRect) -> Void
    
    init(coordinateSpace: CoordinateSpace, onFrameChange: @escaping (_: CGRect) -> Void) {
        self.coordinateSpace = coordinateSpace
        self.onFrameChange = onFrameChange
    }
    
    var body: some View {
        GeometryReader { geo in
            Color.clear
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .onAppear {
                    onFrameChange(geo.frame(in: coordinateSpace))
                }
            
                #if compiler(>=5.9) && canImport(SwiftUI)
                .onChange(of: geo.frame(in: coordinateSpace)) { oldFrame, newFrame in
                    onFrameChange(newFrame)
                }
                #else
                .onChange(of: geo.frame(in: coordinateSpace)) { newFrame in
                    onFrameChange(newFrame)
                }
                #endif
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

extension View {
    func observingFrame(coordinateSpace: CoordinateSpace = .global, onFrameChange: @escaping (_: CGRect) -> Void) -> some View {
        background(FrameObserver(coordinateSpace: coordinateSpace, onFrameChange: onFrameChange))
    }
}
