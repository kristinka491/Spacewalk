//
//  SatelliteDescriptionView.swift
//  Spacewalk
//
//  Created by Krystsina on 2023-04-11.
//

import SwiftUI

struct SatelliteDescriptionView: View {
    var model: SatelliteModel
    var body: some View {
        ZStack() {
            Image("starBackground")
                .resizable()
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    ZStack() {
                        Text(model.name?.uppercased() ?? "")
                            .foregroundColor(.white).bold().opacity(0.2)
                            .font(.custom("Baskerville", size: 60))
                            .padding(.top, 190)
                        
                        Image(model.name ?? "")
                            .resizable()
                            .frame(width: 200, height: 200)
                    }
                    
                    HStack(spacing: 0) {
                        Spacer()
                        
                        Text(model.name ?? "")
                            .foregroundColor(.white)
                            .font(.custom("Baskerville", size: 25))
                    }
                    .padding(.trailing, 10)
                    
                    Text(model.description ?? "")
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .font(.custom("Baskerville", size: 16))
                    
                    HStack(spacing: 5) {
                        VStack(spacing: 0) {
                            Text(model.age ?? "")
                                .foregroundColor(.white)
                                .font(.custom("Baskerville", size: 16)).bold()
                                .padding(.top, 10)
                                .padding(.horizontal, 10)
                            
                            Text(StringConstants.satelliteDescriptionAge)
                                .foregroundColor(.white)
                                .font(.custom("Baskerville", size: 16))
                                .padding(.bottom, 10)
                                .padding(.horizontal, 10)
                        }
                        
                        Divider()
                            .background(Color.white)
                        
                        VStack(spacing: 0) {
                            Text(model.orbitalPeriod ?? "")
                                .foregroundColor(.white)
                                .font(.custom("Baskerville", size: 16)).bold()
                                .padding(.top, 10)
                                .padding(.horizontal, 10)
                            
                            Text(StringConstants.satelliteDescriptionOrbitalPeriod)
                                .foregroundColor(.white)
                                .font(.custom("Baskerville", size: 16))
                                .padding(.bottom, 10)
                                .padding(.horizontal, 10)
                        }
                    }
                }
            }
        }
    }
}

struct SatelliteDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        SatelliteDescriptionView(model: SatelliteModel())
    }
}
