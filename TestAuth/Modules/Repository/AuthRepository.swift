//
//  AuthRepository.swift
//  TestAuth
//
//  Created by Ahmed Elesawy on 29/07/2021.
//

import Foundation

protocol AuthRepositoryProtocol {
    var localStorage: LocalStorageProtocol {get}
    func addNewUser(_ user: UserModel) -> AppResponse<Bool>
    func getUser(email: String) -> AppResponse<UserModel>
}

class AuthRepository: AuthRepositoryProtocol {
    var localStorage: LocalStorageProtocol
    
    init(localStorage: LocalStorageProtocol) {
        self.localStorage = localStorage
    }
    
    func addNewUser(_ user: UserModel) -> AppResponse<Bool> {
        return localStorage.addNewUser(user)
    }
    
    func getUser(email: String) -> AppResponse<UserModel> {
        return localStorage.getUser(email: email)
    }
}
