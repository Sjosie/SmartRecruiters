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
    
    static let testUser = User(name: "Paul", url: "https://www.planetware.com/wpimages/2020/02/france-in-pictures-beautiful-places-to-photograph-eiffel-tower.jpg")
}
