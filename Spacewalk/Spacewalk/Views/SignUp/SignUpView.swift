//
//  SignInView.swift
//  Spacewalk
//
//  Created by Krystsina on 2023-02-20.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var viewModel = SignUpViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("viewBackground")
                    .resizable()
                    .ignoresSafeArea()

                VStack(spacing: 0) {

                    Text(StringConstants.signUpTitle)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .font(.custom("Baskerville", size: 35))
                        .padding(.bottom, 20)


                    Text(StringConstants.signUpDescription)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .font(.custom("Baskerville", size: 20))
                        .padding(.bottom, 20)

                    AuthorizationTextField(placeHolder: StringConstants.signUpUsernamePlaceholder, text: $viewModel.username)

                    AuthorizationTextField(placeHolder: StringConstants.signUpNamePlaceholder, text: $viewModel.name)

                    TogglePasswordTextField(password: $viewModel.password)
                    
                    HStack(spacing: 20) {

                        Text(StringConstants.sighUpAlreadyHaveAnAccount)
                            .foregroundColor(.white)
                            .font(.custom("Baskerville", size: 20))

                        NavigationLink(destination: LogInView()) {
                            Text(StringConstants.signUpLoginButton)
                                .font(.custom("Baskerville", size: 20)).underline()
                                .foregroundColor(.white)
                        }
                    }.padding(.bottom, 20)

                    Button(action: {
                        viewModel.saveUser()
                    }, label: {
                        Text(StringConstants.signUpCreateAnAccountButton)
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
        }
        .toolbar(.hidden)
        .alert(DataError.userIsRegistered.title, isPresented: $viewModel.isShowError) {
        } message: {
            Text(DataError.userIsRegistered.message)
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
