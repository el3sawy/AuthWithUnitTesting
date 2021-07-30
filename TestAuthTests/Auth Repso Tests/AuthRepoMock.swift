////
////  AuthRepoMock.swift
////  TestAuthTests
////
////  Created by Ahmed Elesawy on 29/07/2021.
////
//
//import Foundation
//@testable import TestAuth
//
//class AuthRepoMock: AuthRepositoryProtocol {
//
//    // MARK: - Dependencies
//    var localStorage: LocalStorageProtocol
//
//    init(localStorage: LocalStorageProtocol) {
//        self.localStorage = localStorage
//    }
//
//    // MARK: - Testing Properties
//    var userAdded: AppResponse<Bool>!
//    var userData: AppResponse<UserModel>!
//}
//
////MARK:-  Add User
//extension AuthRepoMock {
//    // Mock Functions
//    func addNewUser(_ user: UserModel) -> AppResponse<Bool> {
//        return userAdded
//    }
//
//    // Mock Behaviour
//    func successAddNewUser() {
//        userAdded = AppResponse.success(true)
//    }
//
//    func userExist() {
//        userAdded = AppResponse.failure(.userExist)
//    }
//
//    func addUserFailure() {
//        userAdded = AppResponse.failure(.userExist)
//    }
//}
//
////MARK:- get user
//extension AuthRepoMock {
//    // Mock Functions
//    func getUser(email: String) -> AppResponse<UserModel> {
//        return userData
//    }
//
//    // Mock Behaviour
//    func getUserDataSuccessfully() {
//        let user = UserStubs.createUser()
//        userData = AppResponse.success(user)
//    }
//
//    func userNotFound() {
//        userData = AppResponse.failure(.userNotFound)
//    }
//}
//
