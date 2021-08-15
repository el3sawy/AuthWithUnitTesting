//
//  LoginPresenterSpy.swift
//  TestAuthTests
//
//  Created by Ahmed Elesawy on 02/08/2021.
//

import Foundation
@testable import TestAuth

class LoginPresenterSpy: LoginPresenterProtocol {
    // MARK: - Testing Properties
    var isCalledLogin = false
    var isCalledPresentRegister = false
    // MARK: - Spy Functions
    func presentRegister() {
        isCalledPresentRegister = true
    }
    func login(email: String?, password: String?) {
        isCalledLogin = true
    }
}
