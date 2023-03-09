//
//  MainView.swift
//  Spacewalk
//
//  Created by Krystsina on 2023-02-23.
//

import SwiftUI

struct StarSystemsView: View {
    @StateObject var viewModel: StarSystemsViewModel
    
    init() {
        _viewModel = StateObject(wrappedValue: .init())
    }
    
    var body: some View {
            List(viewModel.systems, id: \.name) { item in
                VStack(alignment: .leading) {
                    Text(item.name ?? "")
                        .font(.custom("Times New Roman", size: 30)).bold()
                    Text(item.description ?? "")
                        .font(.custom("Times New Roman", size: 20))
                }
            }.onAppear{
                UITableView.appearance().backgroundColor = .black
            }
            .scrollContentBackground(.hidden)
            .listStyle(.plain)
            .task {
                await viewModel.loadData()
        }
    }
}

struct StarSystemsView_Previews: PreviewProvider {
    static var previews: some View {
        StarSystemsView()
    }
}
