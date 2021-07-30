//
//  LocalStorageSpy.swift
//  TestAuthTests
//
//  Created by Ahmed Elesawy on 29/07/2021.
//

import Foundation
@testable import TestAuth

class LocalStorageSpy: LocalStorageProtocol {
    
    var isCalledAddNewUser = false
    var isCalleGetUserUser = false
    
    func addNewUser(_ user: UserModel) -> AppResponse<Bool> {
        isCalledAddNewUser = true
        return AppResponse.success(true)
    }
    
    func getUser(email: String) -> AppResponse<UserModel> {
        isCalleGetUserUser = true
        let user = UserStubs.createUser()
        return AppResponse.success(user)
    }
}
