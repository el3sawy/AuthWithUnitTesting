//
//  AuthRouterSpy.swift
//  TestAuthTests
//
//  Created by Ahmed Elesawy on 11/08/2021.
//

import Foundation
import UIKit
@testable import TestAuth

class AuthRouterSpy: MainRouterSpy, AuthRouterProtocol {
    // MARK: - Testing Properties
    var isPresentRegisterUser = false
    var isPushHome = false
    // MARK: - Spy Functions
    func presentRegisterUser() {
        isPresentRegisterUser = true
    }
    func pushHomeViewController(user name: String) {
        isPushHome = true
    }
}
