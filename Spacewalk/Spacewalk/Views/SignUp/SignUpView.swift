//
//  SignInView.swift
//  Spacewalk
//
//  Created by Krystsina on 2023-02-20.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var viewModel: SignUpViewModel
        
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

                    Text("Hi there!")
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .font(.custom("Times New Roman", size: 35))


                    Text("Please, enter your information below")
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .font(.custom("Times New Roman", size: 20))

                    TextField("username", text: $viewModel.username)
                        .padding(.all)
                        .font(.custom("Times New Roman", size: 20))
                        .foregroundColor(.black)
                        .background(.white)
                        .cornerRadius(20)
                        .autocapitalization(.none)

                    TextField("name", text: $viewModel.name)
                        .padding(.all)
                        .font(.custom("Times New Roman", size: 20))
                        .foregroundColor(.black)
                        .background()
                        .cornerRadius(20)

                    SecureField("password", text: $viewModel.password)
                        .padding(.all)
                        .font(.custom("Times New Roman", size: 20))
                        .foregroundColor(.black)
                        .background()
                        .cornerRadius(20)

                    HStack() {

                        Text("Already have an account?")
                            .foregroundColor(.white)
                            .font(.custom("Times New Roman", size: 20))
                            .padding(.horizontal)

                        NavigationLink(destination: LogInView()) {
                            Text("Log In")
                                .font(.custom("Times New Roman", size: 20))
                                .foregroundColor(.white)
                        }
                    }

                    NavigationLink(destination: MainView().onAppear() {
                        viewModel.saveUser()
                    }) {
                        Text("Create an account")
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

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
