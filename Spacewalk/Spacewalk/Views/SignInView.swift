//
//  SignInView.swift
//  Spacewalk
//
//  Created by Krystsina on 2023-02-20.
//

import SwiftUI

struct SignInView: View {
    var body: some View {
        ZStack {
            Image("viewBackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
        }.toolbar(.hidden)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
