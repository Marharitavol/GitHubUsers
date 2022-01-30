//
//  NetworkManager.swift
//  GitHubUsers
//
//  Created by Rita on 29.01.2022.
//

import Foundation

class NetworkManager {
    
    func fetchData(url: String, completion: @escaping (_ answer: [User])->()) {
        
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else { return }
            
            do {
                let apiResponse = try JSONDecoder().decode([User].self, from: data)
                completion(apiResponse)
            } catch let error {
                print("error json \(error)")
            }
            
        }.resume()
    }
}
