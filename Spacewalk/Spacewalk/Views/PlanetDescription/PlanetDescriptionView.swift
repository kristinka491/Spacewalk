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
            
            ScrollView(showsIndicators: false) {
                VStack() {
                    ZStack() {
                        Text(model.name?.uppercased() ?? "")
                            .foregroundColor(.white).bold().opacity(0.2)
                            .font(.custom("Baskerville", size: 65))
                            .padding(.top, 190)
                        
                        Image(model.name ?? "")
                            .resizable()
                            .frame(width: 200, height: 200)
                        
                        HStack(spacing: 0) {
                            Image("thermometer")
                                .resizable()
                                .frame(width: 30, height: 50)
                                .padding([.leading, .top, .bottom], 10)
                            
                            Text(model.temperature ?? "")
                                .foregroundColor(.white).bold()
                                .font(.custom("Baskerville", size: 18))
                                .padding(.trailing, 10)
                        }
                        .background(Color.black).opacity(0.7)
                        .cornerRadius(50)
                        .padding(.leading, 110)
                        .padding(.bottom, 150)
                    }
                    
                    HStack(spacing: 0) {
                        Text(model.name ?? "")
                            .foregroundColor(.white)
                            .font(.custom("Baskerville", size: 25))
                        Spacer()
                    }
                    .padding(.leading, 10)
                    
                    Divider()
                        .background(Color.white)
                        .padding(.bottom, 10)
                    
                    HStack(spacing: 0) {
                        Text(model.description ?? "")
                            .foregroundColor(.white)
                            .multilineTextAlignment(.trailing)
                            .font(.custom("Baskerville", size: 16))
                        Spacer()
                        
                    }
                    .padding(.horizontal, 10)
                    .padding(.bottom, 20)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            VStack(spacing: 10) {
                                Text(StringConstants.planetDescriptionMass)
                                    .foregroundColor(.black)
                                    .font(.custom("Baskerville", size: 16)).bold()
                                    .padding(.top, 10)
                                    .padding(.horizontal, 10)
                                
                                Text(model.mass ?? "")
                                    .foregroundColor(.black)
                                    .font(.custom("Baskerville", size: 16))
                                    .padding(.bottom, 10)
                                    .padding(.horizontal, 10)
                            }
                            .background(Color.white).opacity(0.7)
                            .cornerRadius(20)
                            
                            VStack(spacing: 10) {
                                Text(StringConstants.planetDescriptionDistanceFromSun)
                                    .foregroundColor(.black)
                                    .font(.custom("Baskerville", size: 16)).bold()
                                    .padding(.top, 10)
                                    .padding(.horizontal, 10)
                                
                                Text(model.distanceFromStar ?? "")
                                    .foregroundColor(.black)
                                    .font(.custom("Baskerville", size: 16))
                                    .padding(.bottom, 10)
                                    .padding(.horizontal, 10)
                            }
                            .background(Color.white).opacity(0.7)
                            .cornerRadius(20)
                            
                            VStack(spacing: 10) {
                                Text(StringConstants.planetDescriptionOrbitalPeriod)
                                    .foregroundColor(.black)
                                    .font(.custom("Baskerville", size: 16)).bold()
                                    .padding(.top, 10)
                                    .padding(.horizontal, 10)
                                
                                Text(model.orbitalPeriod ?? "")
                                    .foregroundColor(.black)
                                    .font(.custom("Baskerville", size: 16))
                                    .padding(.bottom, 10)
                                    .padding(.horizontal, 10)
                            }
                            .background(Color.white).opacity(0.7)
                            .cornerRadius(20)
                        }
                    }.padding(.horizontal, 10)
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
