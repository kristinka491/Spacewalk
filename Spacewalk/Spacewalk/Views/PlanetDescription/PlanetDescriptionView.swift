//
//  PlanetDescriptionView.swift
//  Spacewalk
//
//  Created by Krystsina on 2023-03-20.
//

import SwiftUI

struct PlanetDescriptionView: View {
    @State var isImageRounded = false
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
                            .rotationEffect(.degrees(isImageRounded ? 360.0 : 0.0))
                            .animation(.linear(duration: 2).speed(0.1).repeatForever(autoreverses: false), value: isImageRounded)
                            .onAppear {
                                isImageRounded = true
                            }
                        
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
                        .background(Color.gray)
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
                        HStack(spacing: 5) {
                            VStack(spacing: 0) {
                                Text(model.mass ?? "")
                                    .foregroundColor(.white)
                                    .font(.custom("Baskerville", size: 16)).bold()
                                    .padding(.top, 10)
                                    .padding(.horizontal, 10)
                                
                                Text(StringConstants.planetDescriptionMass)
                                    .foregroundColor(.gray)
                                    .font(.custom("Baskerville", size: 16))
                                    .padding(.bottom, 10)
                                    .padding(.horizontal, 10)
                            }
                            
                            Divider()
                                .background(Color.white)
                            
                            VStack(spacing: 0) {
                                Text(model.distanceFromStar ?? "")
                                    .foregroundColor(.white)
                                    .font(.custom("Baskerville", size: 16)).bold()
                                    .padding(.top, 10)
                                    .padding(.horizontal, 10)
                                
                                Text(StringConstants.planetDescriptionDistanceFromSun)
                                    .foregroundColor(.gray)
                                    .font(.custom("Baskerville", size: 16))
                                    .padding(.bottom, 10)
                                    .padding(.horizontal, 10)
                            }
                            
                            Divider()
                                .background(Color.white)

                            VStack(spacing: 0) {
                                Text(model.orbitalPeriod ?? "").bold()
                                    .foregroundColor(.white)
                                    .font(.custom("Baskerville", size: 16))
                                    .padding(.top, 10)
                                    .padding(.horizontal, 10)
                                
                                Text(StringConstants.planetDescriptionOrbitalPeriod)
                                    .foregroundColor(.gray)
                                    .font(.custom("Baskerville", size: 16))
                                    .padding(.bottom, 10)
                                    .padding(.horizontal, 10)
                            }
                        }.frame(maxWidth: .infinity)
                    }.padding(.horizontal, 10)
                    
                    if model.satellites != nil {
                        Text(StringConstants.planetDescriptionSatellites)
                            .foregroundColor(.white)
                            .font(.custom("Baskerville", size: 20))
                            .padding(.top, 10)
                            .padding(.horizontal, 10)
                    }
                    
                    ScrollView(.horizontal ,showsIndicators: false) {
                        LazyHStack(spacing: 20) {
                            ForEach(model.satellites ?? [], id: \.name) { item in
                                NavigationLink(destination: SatelliteDescriptionView(model: item )) {
                                    SatelliteView(name: item.name ?? "", height: 100, width: 100)
                                }
                            }
                        }
                    }.padding(.leading, 20)
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
