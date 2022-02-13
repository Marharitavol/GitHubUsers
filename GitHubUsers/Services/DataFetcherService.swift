//
//  DataFetcherService.swift
//  GitHubUsers
//
//  Created by Rita on 13.02.2022.
//

import Foundation

class DataFetcherService {
    
    var dataFetcher: DataFetcher!
    
    init(dataFetcher: DataFetcher = NetworkDataFetcher()) {
        self.dataFetcher = dataFetcher
    }
    
    func fetchData(completion: @escaping ([User]?) -> Void) {
        let url = "https://api.github.com/users"
        dataFetcher.fetchGenericJSONData(urlString: url, response: completion)
    }
    
    func fetchUserDetails(user: User, completion: @escaping (UserDetail?) -> Void) {
        let url = "https://api.github.com/users/\(user.login)"
        dataFetcher.fetchGenericJSONData(urlString: url, response: completion)
    }
}
