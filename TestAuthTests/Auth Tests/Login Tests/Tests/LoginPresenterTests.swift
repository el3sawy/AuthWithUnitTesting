//
//  LoginPresenterTests.swift
//  TestAuthTests
//
//  Created by Ahmed Elesawy on 31/07/2021.
//

import XCTest
@testable import TestAuth

class LoginPresenterTests: XCTestCase {
    var validation: ValidationMock!
    var useCase: LoginUseCaseMock!
    var router: AuthRouterSpy!
    var sut: LoginPresenter!
    override func setUpWithError() throws {
        validation = ValidationMock()
        useCase = LoginUseCaseMock()
        router = AuthRouterSpy()
        sut = LoginPresenter(loginUseCase: useCase, validator: validation, router: router)
    }
    override func tearDownWithError() throws {
        validation = nil
        useCase = nil
        router = nil
        sut = nil
    }
    func test_login_validData_success() {
        // given
        let user = UserStubs.createUser()
        let email = user.email
        let password = user.password
        // when
        sut.login(email: email, password: password)
        useCase.successLogin()
        // Then
        XCTAssert(router.isPushHome)
    }
    func test_login_passwordNotMatch_fail() {
        // given
        let user = UserStubs.createUser()
        let email = user.email
        let password = "111111"
        // when
        sut.login(email: email, password: password)
        useCase.simulatePassordNotMatch()
        // Then
        XCTAssertTrue(router.isCalledShowAlert, "Show alert not called")
        XCTAssertEqual(router.alertMessage, ResponseError.invalidUser.description, "Message show in alert not equal")
    }
    func test_login_userNotFound_fail() {
        // given
        let email = "ahmed@gamil.vois"
        let password = "111111"
        // when
        sut.login(email: email, password: password)
        useCase.simulateUserNotFound()
        // Then
        XCTAssertEqual(router.alertMessage, ResponseError.userNotFound.description, "Message show in alert not equal")
        XCTAssertTrue(router.isCalledShowAlert, "Show alert not called")
    }
    func test_Login_NotValidEmail_fail() {
        // given
        let email = "ahmed@vois"
        let password = "111111"
        // when
        validation.simulateEmailNotValid()
        sut.login(email: email, password: password)
        // Then
        XCTAssertEqual(router.alertMessage, AuthErrorEnum.emailNotValid.description, "Message show in alert not equal")
    }
    func test_presentRegister_whenButtonClick_presentRegisterViewController() {
        // When
        sut.presentRegister()
        // Then
        XCTAssert(router.isPresentRegisterUser, "Not called present register view controller")
    }
}
