//
//  MainView.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 08/05/2024.
//

import SwiftUI

enum TabBarItems {
    case home
    case insights
    case budget
    case account
}

struct MainView: View {
    
    @State private var tabSelection: TabBarItems = .home
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundImage = Asset.TabBar.tabbarBackground.image
        appearance.backgroundImageContentMode = .scaleAspectFill
        appearance.backgroundColor = Asset.Colors.primaryLightGray.color
        appearance.shadowColor = .clear
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
        } else {
            UITabBar.appearance().standardAppearance = appearance
        }
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $tabSelection) {
                
                homeTab
                
                insightsTab
                
                Spacer()
                
                budgetTab
                
                accountTab
            }
                Button(action: {
                    
                }, label: {
                    Image(uiImage: Asset.TabBar.floatAddButton.image)
                        .padding(.leading, 3)
                })
            .padding(.bottom, 60)
        }
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.all)
        .transition(.opacity)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
}

extension MainView {
    
    var homeTab: some View {
        HomeView()
            .tabItem {
                self.tabSelection == .home ? Image(uiImage: Asset.TabBar.homeSelected.image) : Image(uiImage: Asset.TabBar.home.image)
                Text(L10n.Tabbar.Title._1)
                    .font(Font.SFPro.medium(size: 13))
            }
            .tag(TabBarItems.home)
    }
    
    var insightsTab: some View {
        AIInsightsView()
            .tabItem {
                self.tabSelection == .insights ? Image(uiImage: Asset.TabBar.insightsSelected.image) : Image(uiImage: Asset.TabBar.insights.image)
                Text(L10n.Tabbar.Title._2)
                    .font(Font.SFPro.medium(size: 13))
            }
            .tag(TabBarItems.insights)
    }
    
    var budgetTab: some View {
        BudgetView()
            .tabItem {
                self.tabSelection == .budget ? Image(uiImage: Asset.TabBar.budgetSelected.image) : Image(uiImage: Asset.TabBar.budget.image)
                Text(L10n.Tabbar.Title._3)
                    .font(Font.SFPro.medium(size: 13))
            }
            .tag(TabBarItems.budget)
    }
    
    var accountTab: some View {
        AccountView()
            .tabItem {
                self.tabSelection == .account ? Image(uiImage: Asset.TabBar.userSelected.image) : Image(uiImage: Asset.TabBar.user.image)
                Text(L10n.Tabbar.Title._4)
                    .font(Font.SFPro.medium(size: 13))
            }
            .tag(TabBarItems.account)
    }
}

#Preview {
    MainView()
}
