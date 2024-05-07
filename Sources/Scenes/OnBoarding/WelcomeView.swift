//
//  WelcomeView.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 02/05/2024.
//

import SwiftUI

struct WelcomeView: View {
    @State private var goToAuth = false
    @State private var shouldSignIn = false
    
    var body: some View {
        NavStackHandler {
            ZStack(alignment: .center) {
                Image(uiImage: Asset.OnBoarding.welcomeBackground.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                VStack(alignment: .center, spacing: 15) {
                    Spacer()
                    textViews
                    signInButton
                    signupButton
                }
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 40, trailing: 20))
                links
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
    
    var textViews: some View {
        Group {
            VStack (spacing: 10) {
                HStack {
                    Text(L10n.Onboarding.Welcome.title)
                        .font(Font.SFPro.bold(size: 40))
                        .foregroundColor(Color(Asset.Color.primaryWhite.color))
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                HStack {
                    Text(L10n.Onboarding.Welcome.description)
                        .font(Font.SFPro.regular(size: 17))
                        .foregroundColor(Color(Asset.Color.primaryWhite.color))
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
            }
        }
        .padding(.bottom, 20)
    }
    
    var signInButton: some View {
        Button(action: {
            self.shouldSignIn = true
            self.goToAuth = true
        }, label: {
            Text(L10n.Onboarding.Welcome.signin)
                .modifier(BlueButtonStyle(state: .enabled))
                .font(Font.SFPro.semiBold(size: 17))
        })
    }
    
    var signupButton: some View {
        Button(action: {
            self.shouldSignIn = false
            self.goToAuth = true
        }, label: {
            Text(L10n.Onboarding.Welcome.signup)
                .modifier(BorderButtonStyle(state: .enabled))
                .font(Font.SFPro.semiBold(size: 17))
            
        })
    }
}

#Preview {
    WelcomeView()
}

extension WelcomeView {
    var links: some View {
        Group {
            NavigationLink(destination: AuthView(shouldSignIn: self.shouldSignIn), isActive: self.$goToAuth) { EmptyView() }
                .isDetailLink(false)
        }
    }
}
