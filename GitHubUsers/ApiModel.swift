//
//  ApiModel.swift
//  GitHubUsers
//
//  Created by Rita on 29.01.2022.
//

import Foundation

struct User: Decodable {
    let login: String
    let id: Int
    let avatar_url: String
    
}
