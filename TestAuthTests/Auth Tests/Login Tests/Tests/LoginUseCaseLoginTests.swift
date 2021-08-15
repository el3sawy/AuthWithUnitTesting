//
//  LoginUseCaseLoginTests.swift
//  TestAuthTests
//
//  Created by Ahmed Elesawy on 14/08/2021.
//

import XCTest
@testable import TestAuth

class LoginUseCaseLoginTests: XCTestCase {
    // MARK: - Dependencies
    var repository: AuthRepoMock!
    var loginProcess: LoginProcessSpy!
    var localStorage: LocalStorageSpy!
    var sut: LoginUseCase!
    override func setUpWithError() throws {
        localStorage = LocalStorageSpy()
        repository = AuthRepoMock(localStorage: localStorage)
        loginProcess = LoginProcessSpy()
        sut = LoginUseCase(authRepository: repository, loginProcess: loginProcess)
    }
    override func tearDownWithError() throws {
        loginProcess = nil
        repository = nil
        localStorage = nil
        sut = nil
    }
    func test_login_withSetValidData_SuccessLogin() {
        // given
        let user = UserStubs.createUser()
        var response: Result<UserModel>?
        repository.resultLogin = Result.success(user)
        let expectation = expectation(description: "login expectation")
        // when
        sut.login(email: user.email, password: user.password) { result in
            response = result
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
        assert(response: response)
        XCTAssertTrue(loginProcess.isCalledLoginProcess)
    }
    func test_login_withSetInvalidUser_fail() {
        // given
        let user = UserStubs.createUser()
        var response: Result<UserModel>?
        let errorLogin = Result<UserModel>.failure(.userNotFound)
        repository.resultLogin = errorLogin
        loginProcess.resultLogin = errorLogin
        let expectation = expectation(description: "login expectation")
        // when
        sut.login(email: user.email, password: user.password) { result in
            response = result
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
        // Then
        assert(response, containsError: ResponseError.userNotFound)
        XCTAssertTrue(loginProcess.isCalledLoginProcess)
    }
}
