//
//  HomrView.swift
//  Spacewalk
//
//  Created by Krystsina on 2023-02-23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @State var isImageRounded = false
   
    var body: some View {
        NavigationStack {
            ZStack() {
                Image("starBackground")
                    .resizable()
                    .ignoresSafeArea()
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0) {
                        
                        Text(StringConstants.homeTitle)
                            .font(.custom("Baskerville", size: 30)).bold()
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .padding(.top, 5)
                            .padding([.trailing, .leading], 20)
                            .padding(.bottom, 10)
                        
                        Text(StringConstants.homeSubtitle)
                            .font(.custom("Baskerville", size: 20))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .padding([.trailing, .leading], 20)
                            .padding(.bottom, 30)
                        
                        Image("Sun")
                            .resizable()
                            .frame(width: 170, height: 170)
                            .padding(.bottom, 10)
                            .rotationEffect(.degrees(isImageRounded ? 360.0 : 0.0))
                            .animation(.linear(duration: 2).speed(0.1).repeatForever(autoreverses: false), value: isImageRounded)
                            .onAppear {
                                isImageRounded = true
                            }
                        
                        Text(viewModel.solarSystem.mainStar ?? "")
                            .font(.custom("Baskerville", size: 20)).bold()
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .padding(.bottom, 20)
                        
                        Text(viewModel.solarSystem.mainStarDescription ?? "")
                            .font(.custom("Baskerville", size: 20))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .padding(.bottom, 20)
                              
                        ScrollView(.horizontal ,showsIndicators: false) {
                            LazyHStack(spacing: 20) {
                                ForEach(viewModel.solarSystem.planets ?? [], id: \.name) { item in
                                    NavigationLink(destination: PlanetDescriptionView(model: item )) {
                                        PlanetView(name: item.name ?? "", height: 150, width: 150)
                                    }
                                }
                            }
                        }
                    }
                }
            }.toolbar(.hidden)
        }.onAppear {
            Task { @MainActor in
               await viewModel.loadData()
            }
        }
    }
}

struct StarSystemsView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
