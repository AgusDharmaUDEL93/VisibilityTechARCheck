//
//  PictureTherapy.swift
//  VisibilityTechARCheck
//
//  Created by Putu Agus Dharma Kusuma on 14/10/24.
//
import SwiftUI

struct PictureTherapyScreen : View {
    @State private var currentZoom = 0.0
    @State private var totalZoom = 1.0
    
    var body : some View {
        ZStack (alignment : .bottom) {
            Image("sad_hamster")
                .resizable()
                .scaledToFit()
                .font(.title)
                .scaleEffect(currentZoom + totalZoom)
                .gesture(
                    MagnificationGesture()
                        .onChanged { value in
                            currentZoom = value - 1
                        }
                        .onEnded { value in
                            totalZoom += currentZoom
                            currentZoom = 0
                        }
                )
            
            Button(action: {
                currentZoom = 0.0
                totalZoom = 1.0
            }, label: {
                Text("Reset")
            })
            .buttonStyle(.borderedProminent)
            
        }
        
        
    }
}

#Preview {
    PictureTherapyScreen()
}
