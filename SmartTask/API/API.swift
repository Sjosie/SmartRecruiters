//
//  NetworkingService.swift
//  SmartTask
//
//  Created by Evgeny Protopopov on 17.03.2022.
//

import Foundation

protocol NetworkingService {
    @discardableResult func searchRepos(completion: @escaping ([User]) -> ()) -> URLSessionDataTask
}

final class NetworkingApi: NetworkingService {
    static let shared = NetworkingApi()
    @discardableResult
    func searchRepos(completion: @escaping ([User]) -> ()) -> URLSessionDataTask {
        var request = URLRequest(url: URL(string: "https://api.github.com/users")!)
        request.setValue("token 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", forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: request) { (data, _, _) in
            DispatchQueue.main.async {
                guard let data = data,
                    let response = try? JSONDecoder().decode([User].self, from: data) else {
                        completion([])
                        return
                }
                completion(response)
            }
        }

        task.resume()
        return task
    }
}


