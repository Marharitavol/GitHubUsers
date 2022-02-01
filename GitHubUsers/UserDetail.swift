//
//  UserDetails.swift
//  GitHubUsers
//
//  Created by Rita on 30.01.2022.
//

import Foundation

struct UserDetail: Decodable {
    let avatar_url: String?
    let name: String?
    let email: String?
    let company: String?
    let following: Int?
    let followers: Int?
}
