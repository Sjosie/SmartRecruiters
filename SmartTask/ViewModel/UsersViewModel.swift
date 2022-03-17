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
    var onErrorHandling : ((ErrorResult?) -> Void)?
    
    init(_ service: NetworkingService = NetworkingApi.shared) {
        self.service = service
        self.getUsers()
    }
    
    func getUsers() {
        guard let service = service else {
            return
        }
        service.searchUsers(completion: { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.arrayOfUsers = data
                    self.onRefreshHandling?()
                    break
                case .failure(let error):
                    print(error)
                    self.onErrorHandling?(ErrorResult.custom(string: error.localizedDescription))
                    break
                }
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
