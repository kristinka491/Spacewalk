//
//  LogInView.swift
//  Spacewalk
//
//  Created by Krystsina on 2023-02-20.
//

import SwiftUI

struct LogInView: View {
    @StateObject var viewModel: LoginViewModel
        
    init() {
        _viewModel = StateObject(wrappedValue: .init())
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("viewBackground")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(alignment: .center, spacing: 20) {
                    
                    Text("Welcome back!")
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .font(.custom("Times New Roman", size: 35))
                    
                    TextField("username", text: $viewModel.username)
                        .padding(.all)
                        .font(.custom("Times New Roman", size: 20))
                        .foregroundColor(.black)
                        .background(.white)
                        .cornerRadius(20)
                    
                    TextField("password", text: $viewModel.password)
                        .padding(.all)
                        .font(.custom("Times New Roman", size: 20))
                        .foregroundColor(.black)
                        .background()
                        .cornerRadius(20)
                    
                    HStack() {
                        
                        Text("Don't have an account?")
                            .foregroundColor(.white)
                            .font(.custom("Times New Roman", size: 20))
                            .padding(.horizontal)
                        
                        NavigationLink(destination: SignUpView()) {
                            Text("Sign Up")
                                .font(.custom("Times New Roman", size: 20))
                                .foregroundColor(.white)
                        }
                    }
                    
                    NavigationLink(destination: MainView().onAppear() {
                        viewModel.getUser()
                    }) {
                        Text("Sign In")
                            .font(.custom("Times New Roman", size: 25))
                            .foregroundColor(.white)
                        
                    }.buttonStyle(.bordered)
                        .buttonBorderShape(.capsule)
                        .controlSize(.large)
                        .disabled(!viewModel.isValid)
                    
                    
                    Divider()
                        .frame(height: 30)
                }
            }
        }.toolbar(.hidden)
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
