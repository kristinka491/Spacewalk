//
//  AuthorizationTextField.swift
//  Spacewalk
//
//  Created by Krystsina on 2023-03-16.
//

import SwiftUI

struct AuthorizationTextField: View {
    var placeHolder: String
    @Binding var text: String
    
    var body: some View {
        TextField(placeHolder, text: $text)
            .font(.custom("Baskerville", size: 20))
            .frame(height: 50)
            .multilineTextAlignment(.center)
            .foregroundColor(.black)
            .background(Color.white)
            .cornerRadius(20)
            .autocapitalization(.none)
            .padding([.trailing, .leading], 10)
            .padding(.bottom, 20)
    }
}

struct AuthorizationTextField_Previews: PreviewProvider {
    @State static var field: String = "Test"
    
    static var previews: some View {
        AuthorizationTextField(placeHolder: "Test", text: $field)
    }
}
