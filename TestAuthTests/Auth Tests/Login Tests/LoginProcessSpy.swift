//
//  LoginProcessSpy.swift
//  TestAuthTests
//
//  Created by Ahmed Elesawy on 14/08/2021.
//

import Foundation
@testable import TestAuth

class LoginProcessSpy: LoginProcessProtocol {
    var isCalledLoginProcess = false
    var resultLogin: Result<UserModel> = .success(UserStubs.createUser())
    func login(_ response: Result<UserModel>, password: String) -> Result<UserModel> {
        isCalledLoginProcess = true
        return resultLogin
    }
}
