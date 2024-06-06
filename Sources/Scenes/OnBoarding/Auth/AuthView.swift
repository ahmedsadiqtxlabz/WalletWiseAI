//
//  AuthView.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 02/05/2024.
//

import SwiftUI

struct AuthView: View {
    @State var shouldSignIn: Bool
    @State private var goToIntro = false
    var body: some View {
        ZStack(alignment: .center) {
            Image(uiImage: Asset.OnBoarding.authBackground.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
            .background(Color.red)
            VStack(alignment: .center) {
                Spacer()
                if shouldSignIn {
                    SignInView(shouldSignIn: $shouldSignIn, goToIntro: $goToIntro)
                        .frame(height: UIScreen.main.bounds.height - 200)
                } else {
                    let viewModel = SignUpViewModel()
                    SignUpView(shouldSignIn: $shouldSignIn, goToIntro: $goToIntro, viewModel: viewModel)
                        .frame(height: UIScreen.main.bounds.height - 200)
                }
                links
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.all)
    }
}

extension AuthView {
    var links: some View {
        Group {
            NavigationLink(destination: IntroView(viewControllers: IntroInfo), isActive: self.$goToIntro) { EmptyView() }
                .isDetailLink(false)
        }
    }
}

#Preview {
    AuthView(shouldSignIn: false)
}
