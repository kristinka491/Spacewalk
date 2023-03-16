//
//  HomeView.swift
//  Spacewalk
//
//  Created by Krystsina on 2023-02-23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack() {
            Image("back")
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 10) {
                        LazyVStack {
                            ForEach(viewModel.systems, id: \.name) { item in
                                
                                Text(item.name ?? "")
                                    .font(.custom("Times New Roman", size: 30))
                                    .bold()
                                    .foregroundColor(.white)
                                    .padding(.bottom, 15)
                                
                                HStack() {
                                    Image(systemName: "planet")
                                    Text(item.description ?? "")
                                        .font(.custom("Times New Roman", size: 20))
                                        .foregroundColor(.white)
                                        .padding(.bottom, 15)
                                }
                            }
                        }
                        .padding([.leading, .trailing, .top], 20)
                    }
                }
                .padding([.bottom, .top], 20)
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
