//
//  SignInView.swift
//  Spacewalk
//
//  Created by Krystsina on 2023-02-20.
//

import SwiftUI

struct SignUpView: View {
    @State private var username: String = ""
    @State private var name: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("viewBackground")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Sign Up")
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .font(.custom("Times New Roman", size: 35))
                    
                    
                    Text("Please, enter your information below")
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .font(.custom("Times New Roman", size: 23))
                    
                    TextField("username", text: $username)
                        .padding(.all)
                        .font(.custom("Times New Roman", size: 20))
                        .foregroundColor(.black)
                        .background(.white)
                        .cornerRadius(20)
                    
                    TextField("name", text: $name)
                        .padding(.all)
                        .font(.custom("Times New Roman", size: 20))
                        .foregroundColor(.black)
                        .background()
                        .cornerRadius(20)
                    
                    TextField("password", text: $password)
                        .padding(.all)
                        .font(.custom("Times New Roman", size: 20))
                        .foregroundColor(.black)
                        .background()
                        .cornerRadius(20)
                    
                    HStack(alignment: .top, spacing: 80) {
                        
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
                    Divider()
                        .frame(height: 50)
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
