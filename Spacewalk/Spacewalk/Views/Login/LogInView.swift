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
        NavigationStack {
            ZStack {
                Image("viewBackground")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(alignment: .center, spacing: 20) {
                    
                    Text(StringConstants.loginTitle)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .font(.custom("Times New Roman", size: 35))
                    
                    TextField(StringConstants.loginUsernamePlaceholder, text: $viewModel.username)
                        .padding(.all)
                        .font(.custom("Times New Roman", size: 20))
                        .foregroundColor(.black)
                        .background(.white)
                        .cornerRadius(20)
                        .autocapitalization(.none)
                    
                    TextField(StringConstants.loginPasswordPlaceholder, text: $viewModel.password)
                        .padding(.all)
                        .font(.custom("Times New Roman", size: 20))
                        .foregroundColor(.black)
                        .background()
                        .cornerRadius(20)
                    
                    HStack() {
                        
                        Text(StringConstants.loginDontHaveAnAccount)
                            .foregroundColor(.white)
                            .font(.custom("Times New Roman", size: 20))
                            .padding(.horizontal)
                        
                        NavigationLink(destination: SignUpView()) {
                            Text(StringConstants.loginSignUpButton)
                                .font(.custom("Times New Roman", size: 20))
                                .foregroundColor(.white)
                        }
                    }
                    
                    Button(action: {
                        viewModel.getUser()
                    }, label: {
                        Text(StringConstants.loginSignInButton)
                            .font(.custom("Times New Roman", size: 25))
                            .foregroundColor(.white)
                    })
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.capsule)
                    .controlSize(.large)
                    .disabled(!viewModel.isValid)
                    
                    Divider()
                        .frame(height: 30)
                }
            }
            .navigationDestination(isPresented: $viewModel.isRegistered) {
                MainView()
            }
        }.toolbar(.hidden)
            .alert(DataError.wrongUsernameOrPassword.title, isPresented: $viewModel.isShowError) {
            } message: {
                Text(DataError.wrongUsernameOrPassword.message)
            }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
