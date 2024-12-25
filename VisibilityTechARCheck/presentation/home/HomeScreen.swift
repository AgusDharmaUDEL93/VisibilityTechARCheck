//
//  HomeScreen.swift
//  VisibilityTechARCheck
//
//  Created by Putu Agus Dharma Kusuma on 10/10/24.
//

import SwiftUI

struct HomeScreen : View {
    var body : some View {
        VStack {
            Spacer()
            
            NavigationLink(
                destination: {
                    PlaygroundScreen()
                },
                label: {
                    Text("AR Therapy")
                }
            )
            .buttonStyle(.borderedProminent)
            Spacer()
                .frame(height: 20)
            NavigationLink(
                destination: {
                    PictureTherapyScreen()
                },
                label: {
                    Text("Picture Therapy")
                }
            )
            .buttonStyle(.borderedProminent)
           
            Spacer()
            Text("Develop by Wang Fe")
        }
        
        .navigationTitle("Design by Wei Da")
    }
}

#Preview {
    NavigationStack {
        HomeScreen()
    }
}


