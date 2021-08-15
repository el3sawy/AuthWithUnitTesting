//
//  ValidationSpy.swift
//  TestAuthTests
//
//  Created by Ahmed Elesawy on 15/08/2021.
//

import Foundation
@testable import TestAuth

class ValidationMock: ValidationsProtocol {
    // MARK: - Testing Properties
    var isCalledName = false
    var isCalledMobile = false
    var isCalledEmail = false
    var isCalledPassword = false
    var validationError: AuthErrorEnum?
    // MARK: - Mock Function
    func name(value: String?) throws -> String {
        isCalledName = true
        guard let error = validationError else {
            return ""
        }
        throw error
    }
    func mobile(value: String?) throws -> String {
        isCalledMobile = true
        return ""
    }
    func email(value: String?) throws -> String {
        isCalledEmail = true
        guard let error = validationError else {
            return ""
        }
        throw error
    }
    func password(value: String?) throws -> String {
        isCalledPassword = true
        return ""
    }
    // MARK: - Mock Behaviours
    func simulateEmptyName() {
        validationError = AuthErrorEnum.nameEmpty
    }
    func simulateEmailNotValid() {
        validationError = AuthErrorEnum.emailNotValid
    }
}
