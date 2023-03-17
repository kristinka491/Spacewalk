//
//  HomeView.swift
//  Spacewalk
//
//  Created by Krystsina on 2023-02-23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @State var isTitleShown = false
    @State var isSubtitleShown = false
    
    var body: some View {
        ZStack() {
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                ZStack() {
                    Text(StringConstants.homeTitle)
                        .font(.custom("Baskerville", size: 40))
                        .foregroundColor(isTitleShown ? .white: .clear)
                        .animation(.easeOut(duration: 2).delay(0.1), value: isTitleShown)
                        .onAppear {
                            isTitleShown = true
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                               isTitleShown = false
                            }
                        }
                    
                    Text(StringConstants.homeSubtitle)
                        .font(.custom("Georgia", size: 20))
                        .foregroundColor(isSubtitleShown ? .white: .clear)
                        .animation(.easeInOut(duration: 5).delay(4), value: isSubtitleShown)
                        .onAppear {
                            isSubtitleShown = true
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                               isSubtitleShown = false
                        }
                    }
                }
            }
        }.task {
            await viewModel.loadData()
        }
    }
}

struct StarSystemsView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
