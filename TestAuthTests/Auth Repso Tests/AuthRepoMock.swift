//
//  AuthRepoMock.swift
//  TestAuthTests
//
//  Created by Ahmed Elesawy on 29/07/2021.
//
//
import Foundation
@testable import TestAuth

class AuthRepoMock: AuthRepositoryProtocol {
    // MARK: - Dependencies
    var localStorage: LocalStorageProtocol
    var resultLogin: Result<UserModel>!
    init(localStorage: LocalStorageProtocol) {
        self.localStorage = localStorage
    }

    // MARK: - Testing Properties
    var completionAddUser: ((Result<Bool>) -> Void)?
    var completionGetUser: ((Result<UserModel>) -> Void)!
    // MARK: - Mock Function
    func addNewUser(_ user: UserModel, completion: @escaping (Result<Bool>) -> Void) {
        completionAddUser = completion
    }
    func getUser(email: String, completion: @escaping (Result<UserModel>) -> Void) {
        completion(resultLogin)
    }
    // MARK: - Mock Behaviours Add New User
    func successAddUser() {
        completionAddUser?(Result.success(true))
    }
    func simulateErrorAddUser() {
        completionAddUser?(Result.failure(.error))
    }
    func simulateUserIsExit() {
        completionAddUser?(Result.failure(.userExist))
    }
}
