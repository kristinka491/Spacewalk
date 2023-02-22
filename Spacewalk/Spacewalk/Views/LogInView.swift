//
//  LogInView.swift
//  Spacewalk
//
//  Created by Krystsina on 2023-02-20.
//

import SwiftUI

struct LogInView: View {
    var body: some View {
        ZStack {
            Image("viewBackground")
                .resizable()
                .ignoresSafeArea()
        }.toolbar(.hidden)
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
