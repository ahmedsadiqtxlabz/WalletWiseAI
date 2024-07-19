//
//  NavStackHandler.swift
//  WalletWiseAI
//
//  Created by Muhammad Arslan on 02/05/2024.
//

import SwiftUI

struct NavStackHandler<T: View>: View {
  let content: () -> T
   
  var body: some View {
    if #available(iOS 16, *) {
        NavigationStack(root: content)
    } else {
      NavigationView(content: content)
        .navigationViewStyle(.stack)
    }
  }
}
