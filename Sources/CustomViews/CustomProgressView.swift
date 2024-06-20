//
//  CustomProgressView.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 11/06/2024.
//

import Foundation
import SwiftUI

struct CustomProgressView: View {
  let progress: CGFloat

  var body: some View {
    GeometryReader { geometry in
      ZStack(alignment: .leading) {
        Rectangle()
              .frame(height: 10)
          .opacity(0.3)
          .foregroundColor(Color(Asset.Colors.primaryWhite.color))
          .cornerRadius(5, corners: .allCorners)

        Rectangle()
          .frame(
            width: min(progress * geometry.size.width,
                       geometry.size.width),
            height: 10
          )
          .foregroundColor(Color(Asset.Colors.primaryBlue.color))
          .cornerRadius(5, corners: .allCorners)
      }
    }
  }
}
