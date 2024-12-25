//
//  ARPlayground.swift
//  VisibilityTechARCheck
//
//  Created by Putu Agus Dharma Kusuma on 08/10/24.
//

import SwiftUI
import RealityKit
import ARKit

struct ARPlayground : UIViewRepresentable {
    
    @Binding var fearedObject : FearedObject
    
    func makeUIView(context: Context) -> ARCustom {
        let arView = ARCustom(frame: .zero)
        
        return arView
    }
    
    func updateUIView(_ uiView: ARCustom, context: Context) {
        uiView.focusEntity?.isEnabled = !fearedObject.isActive
        
        if (fearedObject.isActive) {
            placeFearedObject(in: uiView)
            return
        }
        
        clearFearedObject(in: uiView)
    }
    
    
    
    private func placeFearedObject (in uiView : ARCustom) {
        
        guard let entity = fearedObject.baseModel else { return }
        
        let entityAnchor = AnchorEntity(world: uiView.focusEntity?.position ?? SIMD3(x: 0, y: 0, z: 0) )
        
        entityAnchor.addChild(entity)
        
        uiView.scene.addAnchor(entityAnchor)
        
        guard let animation = fearedObject.animation else { return }
        
        entity.playAnimation(animation.repeat())
        
        
    }
    
    
    
    private func clearFearedObject (in uiView : ARCustom){
        
        guard let entity = fearedObject.baseModel else { return }
        
        if let anchorEntity = entity.anchor {
            uiView.scene.removeAnchor(anchorEntity)
        }
    }

    
    typealias UIViewType = ARCustom
}
