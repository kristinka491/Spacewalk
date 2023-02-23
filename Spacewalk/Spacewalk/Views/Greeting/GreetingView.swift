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
        NavigationView {
            ZStack {
                Image("greetingViewBackground")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                
                VStack {
                    animation(view: Text("Welcome!"), duration: 2, delay: 1)
                        .foregroundColor(.white)
                        .font(.custom("Times New Roman", size: 40))

                    animation(view: Text("Learn more about the universe we all live in"), duration: 2, delay: 2)
                        .foregroundColor(.white)
                        .font(.custom("Times New Roman", size: 20))
                    
                    Divider()
                        .frame(height: 40)
                    
                    VStack {
                        HStack {
                            animation(view: NavigationLink(destination: LogInView()) {
                                                    Text("Explore")
                                                        .font(.custom("Times New Roman", size: 25))
                                                        .foregroundColor(.white)
                                                },
                                      duration: 1,
                                      delay: 3)
                            .buttonBorderShape(.capsule)
                            .tint(.blue.opacity(2.5))
                            .buttonStyle(.bordered)
                            .padding()
    
                            animation(view: NavigationLink(destination: SignUpView()) {
                                                    Text("Sign up")
                                                        .font(.custom("Times New Roman", size: 25))
                                                        .foregroundColor(.white)
                                                        .underline(pattern: .solid)
                                                },
                                      duration: 1,
                                      delay: 4)
                            .padding()
                        }
                    }
                }
            }
        }
    }
    
    func animation <T: View>(view: T, duration: Int, delay: Double) -> some View {
        view.opacity(showText ? 1 : 0)
            .animation(.easeInOut(duration: 1).delay(delay), value: showText)
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
