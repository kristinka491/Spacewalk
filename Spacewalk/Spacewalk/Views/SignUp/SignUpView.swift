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

                VStack(alignment: .center, spacing: 20) {

                    Text(StringConstants.signUpTitle)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .font(.custom("Times New Roman", size: 35))


                    Text(StringConstants.signUpDescription)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .font(.custom("Times New Roman", size: 20))

                    TextField(StringConstants.signUpUsernamePlaceholder, text: $viewModel.username)
                        .padding(.all)
                        .font(.custom("Times New Roman", size: 20))
                        .foregroundColor(.black)
                        .background(.white)
                        .cornerRadius(20)
                        .autocapitalization(.none)

                    TextField(StringConstants.signUpNamePlaceholder, text: $viewModel.name)
                        .padding(.all)
                        .font(.custom("Times New Roman", size: 20))
                        .foregroundColor(.black)
                        .background()
                        .cornerRadius(20)

                    SecureField(StringConstants.signUpPasswordPlaceholder, text: $viewModel.password)
                        .padding(.all)
                        .font(.custom("Times New Roman", size: 20))
                        .foregroundColor(.black)
                        .background()
                        .cornerRadius(20)

                    HStack() {

                        Text(StringConstants.sighUpAlreadyHaveAnAccount)
                            .foregroundColor(.white)
                            .font(.custom("Times New Roman", size: 20))
                            .padding(.horizontal)

                        NavigationLink(destination: LogInView()) {
                            Text(StringConstants.signUpLoginButton)
                                .font(.custom("Times New Roman", size: 20))
                                .foregroundColor(.white)
                        }
                    }

                    Button(action: {
                        viewModel.saveUser()
                    }, label: {
                        Text(StringConstants.signUpCreateAnAccountButton)
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
                StarSystemsView()
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
