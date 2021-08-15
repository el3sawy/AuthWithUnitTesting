//
//  LoginUseCaseMock.swift
//  TestAuthTests
//
//  Created by Ahmed Elesawy on 14/08/2021.
//

import Foundation
@testable import TestAuth

class LoginUseCaseMock: LoginUseCaseProtocol {
    // MARK: - Testing Properties
    var completion: ((Result<UserModel>) -> Void)?
    // MARK: - Mock Behaviour
    func successLogin() {
        let user = UserStubs.createUser()
        completion?(Result.success(user))
    }
    func simulateUserNotFound() {
        completion?(Result.failure(.userNotFound))
    }
    func simulateSomethingErrorInLogin() {
        completion?(Result.failure(.error))
    }
    func simulatePassordNotMatch() {
        completion?(Result.failure(.invalidUser))
    }
    // MARK: - Mock Function
    func login(email: String, password: String, completion: @escaping (Result<UserModel>) -> Void) {
        self.completion = completion
    }
}
