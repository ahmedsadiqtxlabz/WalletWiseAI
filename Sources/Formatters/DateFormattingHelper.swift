//
//  DateFormattingHelper.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 14/06/2024.
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
