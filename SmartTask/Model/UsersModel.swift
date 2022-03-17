//
//  UsersModel.swift
//  SmartTask
//
//  Created by Evgeny Protopopov on 17.03.2022.
//

import Foundation

struct User: Codable {
    
    let name: String?
    let url: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "login"
        case url = "avatar_url"
    }
}
