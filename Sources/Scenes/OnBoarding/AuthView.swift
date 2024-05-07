//
//  AuthView.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 02/05/2024.
//

import SwiftUI

struct AuthView: View {
    @State var shouldSignIn: Bool
    var body: some View {
        ZStack(alignment: .center) {
            Image(uiImage: Asset.OnBoarding.authBackground.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
            .background(Color.red)
            VStack(alignment: .center) {
                Spacer()
                if shouldSignIn {
                    SignInView(shouldSignIn: $shouldSignIn)
                        .frame(height: UIScreen.main.bounds.height - 200)
                } else {
                    SignUpView(shouldSignIn: $shouldSignIn)
                        .frame(height: UIScreen.main.bounds.height - 200)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    AuthView(shouldSignIn: false)
}
