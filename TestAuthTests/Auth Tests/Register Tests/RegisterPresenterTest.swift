//
//  RegitserTest.swift
//  TestAuthTests
//
//  Created by Ahmed Elesawy on 31/07/2021.
//
//
import XCTest
@testable import TestAuth

class RegisterPresenterTest: XCTestCase {
    var repo: AuthRepoMock!
    var validation: ValidationMock!
    var localStorageSpy: LocalStorageSpy!
    var sut: RegisterPresenter!
    var router: AuthRouterSpy!
    override func setUpWithError() throws {
        localStorageSpy = LocalStorageSpy()
        router = AuthRouterSpy()
        repo = AuthRepoMock(localStorage: localStorageSpy)
        validation = ValidationMock()
        sut = RegisterPresenter(repo: repo, validator: validation, router: router)
    }

    override func tearDownWithError() throws {
        router = nil
        repo = nil
        validation = nil
        localStorageSpy = nil
        sut = nil
    }
    func test_addNewUser_validData_successAdded() {
        // Given
        let user = UserInputFormModel(name: "Ahmed", phone: "11111111111", email: "ahmed@ahmed.com", password: "12121212")
        // When
        sut.register(user: user)
        repo.successAddUser()
        // Then
        XCTAssertTrue(router.isPushHome)
    }
    func test_addNewUser_userNotFound_errorAdd() {
        // given
        let user = UserInputFormModel(name: "Ahmed", phone: "11111111111", email: "ahmed@ahmed.com", password: "12121212")
        // When
        sut.register(user: user)
        repo.simulateErrorAddUser()
        // Then
        XCTAssertFalse(router.isPushHome)
        XCTAssertEqual(router.alertMessage, ResponseError.error.description)
    }
    func test_addNewUser_userNotExist_errorAddUserIsExits() {
        // Given
        let user = UserInputFormModel(name: "Ahmed", phone: "11111111111", email: "ahmed@ahmed.com", password: "12121212")
        // When
        sut.register(user: user)
        repo.simulateUserIsExit()
        // Then
        XCTAssertFalse(router.isPushHome)
        XCTAssertEqual(router.alertMessage, ResponseError.userExist.description)
    }
    func test_AddNewUser_NameIsEmpty_showAlert() {
        // Given
        let user = UserInputFormModel(name: "", phone: "11111111111", email: "ahmed@ahmed.com", password: "12121212")
        // When
        validation.simulateEmptyName()
        sut.register(user: user)
        // Then
        XCTAssert(router.isCalledShowAlert)
    }
    func test_dismiss_whenClickCancel_dismissRegisterViewController() {
        // When
        sut.dismiss()
        // Then
        XCTAssert(router.isCalledDismissViewController, "Dismiss view controller not called")
    }
}
