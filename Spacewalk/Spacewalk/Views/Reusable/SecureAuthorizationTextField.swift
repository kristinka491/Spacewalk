//
//  SecureAuthorizationTextField.swift
//  Spacewalk
//
//  Created by Krystsina on 2023-03-16.
//

import SwiftUI

struct SecureAuthorizationTextField: View {
    var placeHolder: String
    @Binding var text: String
    
    var body: some View {
        SecureField(placeHolder, text: $text)
            .font(.custom("Baskerville", size: 20))
            .frame(height: 50)
            .multilineTextAlignment(.center)
            .foregroundColor(.black)
            .autocapitalization(.none)
            .padding(.leading, 30)
    }
}

struct SecureAuthorizationTextField_Previews: PreviewProvider {
    @State static var field: String = "Test"
    
    static var previews: some View {
        SecureAuthorizationTextField(placeHolder: "Test", text: $field)
    }
}
