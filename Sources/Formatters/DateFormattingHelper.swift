//
//  DateFormattingHelper.swift
//  WalletWiseAI
//
//  Created by Muhammad Arslan on 14/06/2024.
//

import Foundation

class DateFormattingHelper {
    
    static let shared = DateFormattingHelper()
    
    lazy var filtersDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }()
    
}
