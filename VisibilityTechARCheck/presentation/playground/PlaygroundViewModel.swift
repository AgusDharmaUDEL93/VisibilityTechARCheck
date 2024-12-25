//
//  PlaygroundViewModel.swift
//  VisibilityTechARCheck
//
//  Created by Putu Agus Dharma Kusuma on 08/10/24.
//

import Observation
import Combine
import RealityKit
import ARKit
import SceneKit

@Observable
class PlaygroundViewModel {
    var fearedObject : FearedObject = FearedObject()
    
    var errorMessage : String?
    
    init() {
       getFearedObject()
    }
        
    private func getFearedObject ()  {
        fearedObject.baseModel = try? ModelEntity.loadModel(named: "kucheng.usdz")
        fearedObject.animation = try? ModelEntity.loadModel(named: "kucheng_eat_animation.usdz").availableAnimations.first
    }
    
    func placeItem (){
        fearedObject.isActive = true
    }
    
    func clearItem () {
        fearedObject.isActive = false
    }
 
}
