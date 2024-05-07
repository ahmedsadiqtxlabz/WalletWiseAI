//
//  Fonts+Custom.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 02/05/2024.
//

import SwiftUI

extension Font {
    struct SFPro {
        static func regular(size: CGFloat) -> Font {
            .custom("SFProText-Regular", size: size)
        }
        
        static func medium(size: CGFloat) -> Font {
            .custom("SFProText-Medium", size: size)
        }
        
        static func semiBold(size: CGFloat) -> Font {
            .custom("SFProText-Semibold", size: size)
        }
        static func bold(size: CGFloat) -> Font {
            .custom("SFProText-Bold", size: size)
        }
    }
}
