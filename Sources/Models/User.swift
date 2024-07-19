//
//  User.swift
//  WalletWiseAI
//
//  Created by Muhammad Arslan on 10/07/2024.
//

import Foundation
import SwiftyUserDefaults

class User: Codable, DefaultsSerializable {
    var name: String
    var email: String
    var image: String
    
    init(name: String = "", email: String = "", image: String = "") {
        self.name = name
        self.email = email
        self.image = image
    }
    
    convenience init(data: [String: Any]) {
        let name = data["name"] as? String ?? ""
        let email = data["email"] as? String ?? ""
        let image = data["image"] as? String ?? ""
        self.init(name: name, email: email, image: image)
    }
    
    func encode() -> [String: Any] {
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(self),
           let jsonObject = try? JSONSerialization.jsonObject(with: encodedData, options: []),
           let dictionary = jsonObject as? [String: Any] {
            return dictionary
        }
        return [:]
    }
}
