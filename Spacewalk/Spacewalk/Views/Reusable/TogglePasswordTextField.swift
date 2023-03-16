//
//  TogglePasswordTextField.swift
//  Spacewalk
//
//  Created by Krystsina on 2023-03-16.
//

import SwiftUI

struct TogglePasswordTextField: View {
    @State private var isSecure = true
    @Binding var password: String
    
    var body: some View {
        HStack(spacing: 0) {
            if isSecure == true {
                SecureAuthorizationTextField(placeHolder: StringConstants.signUpPasswordPlaceholder, text: $password)
            } else {
                AuthorizationTextField(placeHolder: StringConstants.signUpPasswordPlaceholder, text: $password)
                    .padding(.leading, 30)
                    .padding(.bottom, -20)
            }
                
            Image(systemName: isSecure ? "eye" : "eye.slash")
                .foregroundColor(.black)
                .padding(.trailing, 10)
                .onTapGesture {
                    isSecure.toggle()
                }
        }
        .background(Color.white)
        .cornerRadius(20)
        .padding([.trailing, .leading, .bottom], 10)
    }
}

struct TogglePasswordTextField_Previews: PreviewProvider {
    @State static var password: String = "password"
    
    static var previews: some View {
        TogglePasswordTextField(password: $password)
    }
}
