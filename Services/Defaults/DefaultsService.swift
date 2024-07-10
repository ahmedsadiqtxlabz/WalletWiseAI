//
//  Defaults.swift
//  WalletWiseAI
//
//  Created by Hannan Khan on 10/07/2024.
//

import SwiftyUserDefaults

struct DefaultsService {
    
    static var token: String {
        get {
            return Defaults[\.token]
        }
        set {
            Defaults[\.token] = newValue
        }
    }
    
    static var user: User {
        get {
            return Defaults[\.user]
        }
        set {
            Defaults[\.user] = newValue
        }
    }
    
}

extension DefaultsKeys {
    var token: DefaultsKey<String> { .init("token", defaultValue: "") }
    var user: DefaultsKey<User> { .init("user", defaultValue: User()) }
}
