//
//  SignUpView.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 03/05/2024.
//

import SwiftUI

struct SignUpView: View {
    @Binding var shouldSignIn: Bool
    @Binding var goToIntro: Bool
    @State var isFormValid: Bool = false
    
    @ObservedObject var viewModel: SignUpViewModel
    
    var body: some View {
        
        ZStack(alignment: .center) {
            Rectangle()
                .foregroundColor(Color(Asset.Colors.primaryLightGray.color))
                .cornerRadius(60, corners: [.topRight])
            VStack(alignment: .center, spacing: 30) {
                titleView
                textFields
                signUpButton
                    .padding(.top, 20)
                continueView
                socialIconsView
                Spacer()
                noAccountView
            }
            .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
            if viewModel.showMessage {
                MessageView(showMessage: $viewModel.showMessage, message: viewModel.errorMessage, isError: true)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    var titleView: some View {
        HStack(alignment: .center) {
            Text(L10n.Onboarding.Welcome.signup)
                .font(Font.SFPro.bold(size: 23))
                .foregroundColor(.black)
                .padding(.top, 30)
            Spacer()
        }
    }
    
    var textFields: some View {
        VStack(alignment: .center, spacing: 20) {
            Group {
                WalletWiseTextField(
                    text: $viewModel.fullName, placeholder: L10n.Onboarding.Signin.fullName,
                    leadingImage: Asset.OnBoarding.usernameIcon.image,
                    keyboardType: .default, capitalization: .words)
                WalletWiseTextField(
                    text: $viewModel.email, placeholder: L10n.Onboarding.Signin.emailText,
                    leadingImage: Asset.OnBoarding.emailIcon.image,
                    keyboardType: .default, capitalization: .none)
                WalletWiseSecureTextField(
                    text: $viewModel.password, placeholder: L10n.Onboarding.Signin.password,
                    leadingImage: Asset.OnBoarding.passwordIcon.image,
                    keyboardType: .default)
            }
        }
    }
    
    var signUpButton: some View {
        Button(action: {
            if viewModel.isValid() {
//                self.goToIntro = true
                viewModel.signUp()
            }
        }, label: {
            Text(L10n.Onboarding.Welcome.signup)
                .modifier(BlueButtonStyle(state: .enabled))
                .font(Font.SFPro.semiBold(size: 17))
        })
    }
    
    var continueView: some View {
        HStack(alignment: .center, spacing:  10) {
            Image(uiImage: Asset.OnBoarding.line.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
                .frame(width: 80)
            Text(L10n.Onboarding.Signin.continueText)
                .font(Font.SFPro.medium(size: 15))
                .foregroundColor(Color.gray)
            Image(uiImage: Asset.OnBoarding.line.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15))
                .frame(width: 80)
            
        }
    }
    
    var socialIconsView: some View {
            HStack(alignment: .center, spacing: 25) {
                Group {
                    Button(action: {
                        
                    }, label: {
                        Image(uiImage: Asset.OnBoarding.googleIcon.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.blue)
                                        .padding(15)
                                        .background(Color.white)
                                        .cornerRadius(30, corners: .allCorners)
                                        .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 2)
                    })
                    Button(action: {
                        
                    }, label: {
                        Image(uiImage: Asset.OnBoarding.appleIcon.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.blue)
                                        .padding(15)
                                        .background(Color.white)
                                        .cornerRadius(30, corners: .allCorners)
                                        .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 2)
                    })
                    Button(action: {
                        
                    }, label: {
                        Image(uiImage: Asset.OnBoarding.facebookIcon.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.blue)
                                        .padding(15)
                                        .background(Color.white)
                                        .cornerRadius(30, corners: .allCorners)
                                        .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 2)
                    })
                }
            }
    }
    
    var noAccountView: some View {
            HStack(alignment: .center, spacing: 5) {
                Text(L10n.Onboarding.Signin.haveAccount)
                    .font(Font.SFPro.regular(size: 16))
                    .foregroundColor(.gray)
                Button(action: {
                    self.shouldSignIn = true
                }, label: {
                    Text(L10n.Onboarding.Welcome.signin)
                        .font(Font.SFPro.bold(size: 16))
                })
            }
        .padding(.bottom, 40)
    }
}

#Preview {
    SignUpView(
        shouldSignIn: Binding.constant(false),
        goToIntro: Binding.constant(false),
        viewModel: SignUpViewModel())
}
