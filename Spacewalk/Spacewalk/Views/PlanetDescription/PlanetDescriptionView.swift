//
//  PlanetDescriptionView.swift
//  Spacewalk
//
//  Created by Krystsina on 2023-03-20.
//

import SwiftUI

struct PlanetDescriptionView: View {
    var model: PlanetsModel
    var body: some View {
        ZStack() {
            Image("starBackground")
                .resizable()
                .ignoresSafeArea()
            
            VStack() {
                ZStack() {
                    Text("MARS")
                        .foregroundColor(.white).bold().opacity(0.2)
                        .font(.custom("Baskerville", size: 80))
                        .padding(.top, 170)
                    
                    Image("Mars")
                        .resizable()
                        .frame(width: 200, height: 200)
//                        .opacity(0.8)
                    HStack(spacing: 2) {
                        Image("thermometer")
                        
                        Text("12 C")
                    }
                }
            }
        }
    }
}

struct PlanetDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetDescriptionView(model: PlanetsModel())
    }
}
