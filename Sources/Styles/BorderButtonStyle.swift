//
//  BorderButtonStyle.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 02/05/2024.
//

import SwiftUI

// Note: Attach to the text inside the button instead of the button itself.
struct BorderButtonStyle: ViewModifier {

  enum State {
    case enabled
    case disabled
  }

  let state: State

  func body(content: Content) -> some View {
    content
      .frame(minWidth: 0, maxWidth: .infinity)
      .padding()
      .foregroundColor(Color(Asset.Colors.primaryWhite.color))
      .background(Color.clear)
      .cornerRadius(10)
      .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(Asset.Colors.primaryWhite.color), lineWidth: 2))
  }
}
