//
//  UsersViewModelTests.swift
//  UsersViewModelTests
//
//  Created by Evgeny Protopopov on 17.03.2022.
//

import XCTest
@testable import SmartTask

class UsersViewModelTests: XCTestCase {

    var viewModel: UsersViewModel!
    var service: MockUserListService!
    
    override func setUp() {
        super.setUp()
        self.service = MockUserListService()
        self.viewModel = UsersViewModel(service)
    }
    
    override func tearDown() {
        self.viewModel = nil
        self.service = nil
        super.tearDown()
    }
    
    func testFetchWithNoService() {
        let expectation = XCTestExpectation(description: "No service found")
        // set service to nil
        viewModel.service = nil
        // expected error for no service found
        viewModel.onErrorHandling = { _ in
            expectation.fulfill()
        }
        viewModel.getUsers()
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testFetchWithData() {
        let expectation = XCTestExpectation(description: "List found")
        service.baseModel = User.testUser
        // expected response
        viewModel.onRefreshHandling = { () in
            expectation.fulfill()
        }
        viewModel.getUsers()
        wait(for: [expectation], timeout: 5.0)
    }

}

class MockUserListService: NetworkingService {
    
    var baseModel: User?

    func searchUsers(completion: @escaping (Result<[User], ErrorResult>) -> Void) {
        if let baseModel = baseModel {
            completion(Result.success([baseModel]))
        } else {
            completion(Result.failure(ErrorResult.custom(string: "Network failure")))
        }
    }

}
