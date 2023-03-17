//
//  LogInView.swift
//  Spacewalk
//
//  Created by Krystsina on 2023-02-20.
//

import SwiftUI

struct LogInView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("viewBackground")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    
                    Text(StringConstants.loginTitle)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .font(.custom("Baskerville", size: 35))
                        .padding(.bottom, 20)
                    
                    AuthorizationTextField(placeHolder: StringConstants.loginUsernamePlaceholder, text: $viewModel.username)
                    
                    TogglePasswordTextField(password: $viewModel.password)
                    
                    HStack(spacing: 20) {
                        
                        Text(StringConstants.loginDontHaveAnAccount)
                            .foregroundColor(.white)
                            .font(.custom("Baskerville", size: 20))
                            
                        
                        NavigationLink(destination: SignUpView()) {
                            Text(StringConstants.loginSignUpButton)
                                .font(.custom("Baskerville", size: 20)).underline()
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.bottom, 20)
                    
                    Button(action: {
                        viewModel.getUser()
                    }, label: {
                        Text(StringConstants.loginSignInButton)
                            .font(.custom("Baskerville", size: 25))
                            .foregroundColor(.white)
                    })
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.capsule)
                    .controlSize(.large)
                    .disabled(!viewModel.isValid)
                }
            }
            .navigationDestination(isPresented: $viewModel.isRegistered) {
                HomeView()
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
