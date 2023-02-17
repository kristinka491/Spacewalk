//
//  GreetingView.swift
//  Spacewalk
//
//  Created by Krystsina on 2023-02-17.
//

import SwiftUI

struct GreetingView: View {
    
    var body: some View {
        ZStack {
            Image("greetingViewBackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            VStack {
                Text("Explore the Universe!")
                    .foregroundColor(.white)
                    .font(.custom("Times New Roman", size: 40))
                    .offset(y: 25)
                
                Text("Learn more about the universe we all live in")
                    .foregroundColor(.gray)
                    .font(.custom("Times New Roman", size: 20))
                    .offset(y: 60)
            }
        }
    }
}

struct GreetingView_Previews: PreviewProvider {
    static var previews: some View {
        GreetingView()
    }
}
