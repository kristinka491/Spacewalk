//
//  PlanetView.swift
//  Spacewalk
//
//  Created by Krystsina on 2023-03-20.
//

import SwiftUI

struct PlanetView: View {
    var name: String
    var height: CGFloat
    var width: CGFloat
    
    var body: some View {
        VStack(spacing: 0) {
            Image(name)
                .resizable()
                .frame(width: width, height: height)
                .padding(.bottom, 10)
            
            Text(name)
                .font(.custom("Baskerville", size: 20)).bold()
                .foregroundColor(.white)
        }
    }
}

struct PlanetView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetView(name: "earth", height: 40, width: 40)
    }
}
