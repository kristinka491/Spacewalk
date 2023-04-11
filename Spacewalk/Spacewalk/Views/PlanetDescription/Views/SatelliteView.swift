//
//  SatelliteView.swift
//  Spacewalk
//
//  Created by Krystsina on 2023-04-11.
//

import SwiftUI

struct SatelliteView: View {
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
                .font(.custom("Baskerville", size: 15)).bold()
                .foregroundColor(.white)
        }
    }
}

struct SatelliteView_Previews: PreviewProvider {
    static var previews: some View {
        SatelliteView(name: "Io", height: 20, width: 20)
    }
}
