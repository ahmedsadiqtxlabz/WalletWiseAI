//
//  IntroView.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 07/05/2024.
//

import SwiftUI

struct IntroductionInfo {
    let title: String
    let detail: String
    let image: UIImage
    let index: Int
}

let IntroInfo = [
    IntroductionInfo(
        title: L10n.Onboarding.Intro.title1,
        detail: L10n.Onboarding.Intro.detail1,
        image: Asset.OnBoarding.Intro.logo1.image,
        index: 0
    ),
    IntroductionInfo(
        title: L10n.Onboarding.Intro.title2,
        detail: L10n.Onboarding.Intro.detail2,
        image: Asset.OnBoarding.Intro.logo2.image,
        index: 1
    )
].map {
    UIHostingController(
        rootView: IntroPageView(
            title: $0.title,
            detail: $0.detail,
            image: $0.image,
            index: $0.index
        )
    )
}

struct IntroView<Page: View>: View {
    
    @State private var currentPage = 0
    @State private var goToHome = false
    var viewControllers: [UIHostingController<Page>]
    
    var body: some View {
        ZStack(alignment: .center) {
            PageViewController(controllers: viewControllers, currentPage: $currentPage)
            VStack(alignment: .center, spacing: 15) {
                Spacer()
                PageControl(numberOfPages: viewControllers.count, currentPage: $currentPage)
                if currentPage == 0 {
                    Button(action: {
                        self.currentPage = 1
                    }, label: {
                        Text(L10n.Onboarding.Intro.button1)
                            .font(Font.SFPro.bold(size: 17))
                            .modifier(BlueButtonStyle(state: .enabled))
                    })
                } else {
                    Button(action: {
                        self.goToHome = true
                    }, label: {
                        Text(L10n.Onboarding.Intro.button2)
                            .font(Font.SFPro.bold(size: 17))
                            .modifier(BlueButtonStyle(state: .enabled))
                    })
                }
                links
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 30, trailing: 20))
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.all)
    }
}

extension IntroView {
    private var links: some View {
        NavigationLink(destination: MainView(), isActive: self.$goToHome) { EmptyView() }
            .isDetailLink(false)
    }
}

#Preview {
    IntroView(
        viewControllers: [
            UIHostingController(
                rootView: IntroPageView(
                    title: "cheese",
                    detail: "blah",
                    image: Asset.OnBoarding.Intro.logo1.image,
                    index: 0
                )
            )
        ])
}
