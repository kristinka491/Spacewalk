//
//  GreetingView.swift
//  Spacewalk
//
//  Created by Krystsina on 2023-02-17.
//

import SwiftUI

struct GreetingView: View {
    
    @State private var showText = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("greetingViewBackground")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    animation(view: Text(StringConstants.greetingTitle), duration: 2, delay: 1)
                        .foregroundColor(.white)
                        .font(.custom("Baskerville", size: 40))
                        .padding(.bottom, 20)
                    
                    animation(view: Text(StringConstants.greetingDescription), duration: 2, delay: 2)
                        .foregroundColor(.white)
                        .font(.custom("Baskerville", size: 20))
                        .padding(.bottom, 20)
                        
                    HStack(spacing: 20) {
                        animation(view: NavigationLink(destination: LogInView()) {
                            Text(StringConstants.greetingExploreButton)
                                .font(.custom("Baskerville", size: 25))
                                .foregroundColor(.white)
                        },
                                  duration: 1,
                                  delay: 3)
                        .buttonBorderShape(.capsule)
                        .tint(.blue.opacity(2.5))
                        .buttonStyle(.bordered)
                        
                        animation(view: NavigationLink(destination: SignUpView()) {
                            Text(StringConstants.greetingSignUpButton)
                                .font(.custom("Baskerville", size: 25))
                                .foregroundColor(.white)
                                .underline(pattern: .solid)
                        },
                                  duration: 1,
                                  delay: 4)
                    }
                }
            }
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

struct GreetingView_Previews: PreviewProvider {
    static var previews: some View {
        GreetingView()
    }
}
