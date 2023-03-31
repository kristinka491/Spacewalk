//
//  WelcomeView.swift
//  Spacewalk
//
//  Created by Krystsina on 2023-03-31.
//

import SwiftUI

struct WelcomeView: View {
    @State var showText = false
    
    var body: some View {
        NavigationStack{
            ZStack() {
                Image("starBackground")
                    .resizable()
                    .ignoresSafeArea()
                    
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        animation(view: Text(StringConstants.welcomeTitle)
                            .font(.custom("Baskerville", size: 30))
                            .foregroundColor(.white)
                            .padding(.leading, 10),
                                  duration: 1,
                                  delay: 1)
                        
                        Spacer()
                    }
                    .padding(.bottom, 20)
                    
                    HStack(spacing: 0) {
                        animation(view: Text(StringConstants.welcomeSubtitle)
                            .font(.custom("Baskerville", size: 20))
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.white)
                            .padding(.bottom, 20)
                            .padding(.leading, 10),
                                  duration: 1,
                                  delay: 2)
                        
                        
                        Spacer()
                    }

                    HStack(spacing: 0) {
                        animation(view: NavigationLink(destination: GreetingView()) {
                            Text(StringConstants.welcomeButtonTitle)
                                .font(.custom("Baskerville", size: 25))
                                .foregroundColor(.white)
                        }
                        .buttonBorderShape(.capsule)
                        .tint(.gray.opacity(2))
                        .buttonStyle(.bordered)
                        .padding(.leading, 10),
                                  duration: 1,
                                  delay: 3)

                        Spacer()
                    }
                }
            }
            .toolbar(.hidden)
        }
    }
    
    func animation <T: View>(view: T, duration: Int, delay: Double) -> some View {
        view.opacity(showText ? 1 : 0)
            .animation(.easeInOut(duration: Double(duration)).delay(delay), value: showText)
            .onAppear {
                showText = true
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
