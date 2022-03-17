//
//  UsersViewModel.swift
//  SmartTask
//
//  Created by Evgeny Protopopov on 17.03.2022.
//

import Foundation

class UsersViewModel {
    
    var service: NetworkingService?
    private var arrayOfUsers = [User]()
    var onRefreshHandling : (() -> Void)?

    init(_ service: NetworkingService = NetworkingApi.shared) {
        self.service = service
    }
    
    func getUsers() {
        guard let service = service else {
            return
        }
        service.searchRepos(completion: { users in
            DispatchQueue.main.async {
                self.arrayOfUsers = users
                self.onRefreshHandling?()
            }
        })
    }
    
}

extension UsersViewModel {
    func numberOfUser() -> Int {
        return arrayOfUsers.count
    }
    
    func getUser(at index: Int) -> User? {
        if arrayOfUsers.indices.contains(index) {
            return arrayOfUsers[index]
        }
        return nil
    }
    
}
