//
//  PlaygroundScreen.swift
//  VisibilityTechARCheck
//
//  Created by Putu Agus Dharma Kusuma on 08/10/24.
//

import SwiftUI

struct PlaygroundScreen : View {
    
    @State var viewModel = PlaygroundViewModel()
    
    var body : some View {
        ZStack (alignment : .bottom) {
            ARPlayground(fearedObject: $viewModel.fearedObject)
                .ignoresSafeArea()
            
            HStack {
                Spacer()
                if (viewModel.fearedObject.isActive){
                    Button(
                        action: {
                            viewModel.clearItem()
                        },
                        label: {
                            Text("Clear Item")
                        }
                    )
                    .buttonStyle(.borderedProminent)
                } else {
                    Button(
                        action: {
                            viewModel.placeItem()
                        },
                        label: {
                            Text("Place Item")
                        }
                    )
                    .buttonStyle(.borderedProminent)
                }
                
                Spacer()
            }
            .padding(.bottom, 50)
            .alert(
                viewModel.errorMessage ?? "Unexpected Error Occured!",
                isPresented: Binding(
                    get: {
                        viewModel.errorMessage != nil
                    },
                    set: {
                        if !$0 {viewModel.errorMessage = nil}
                    }
                ),
                actions: {
                    Button("OK", role: .cancel) {}
                }
            )
            
        }
    }
}

#Preview {
    PlaygroundScreen()
}
