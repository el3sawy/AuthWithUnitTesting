//
//  LoginViewControllerTests.swift
//  TestAuthTests
//
//  Created by Ahmed Elesawy on 02/08/2021.
//

import XCTest
import UIKit
@testable import TestAuth
// ref
// https://www.appsdeveloperblog.com/test-view-controller-push-to-navigation-controller/
class LoginViewControllerTests: XCTestCase {
    var stub: LoginViewController!
    var presenter: LoginPresenterSpy!
    var nav: NavigationControllerSpy!
    var presentVC: PresentViewControllerSpy!
    override func setUpWithError() throws {
        presenter = LoginPresenterSpy()
        stub = LoginViewController()
        stub.loadViewIfNeeded()
        stub.presenter = presenter
        nav = NavigationControllerSpy(rootViewController: stub)
        presentVC = PresentViewControllerSpy()
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        window.rootViewController = stub
    }
    override func tearDownWithError() throws {
        stub = nil
        nav = nil
    }
    func test_WhenCreate_TextFieldHasOutletAndEmptyText() throws {
        let txtEmail = try XCTUnwrap(stub.emailTextField, "Email TextFiled is not connected to IBOutlet")
        let txtPassword = try XCTUnwrap(stub.passwordTextField, "Password TextFiled is not connected to IBOutlet")
        XCTAssertEqual(txtEmail.text, "", "Email is not empty")
        XCTAssertEqual(txtPassword.text, "", "Password is not empty")
    }
    func testButtonLogin_WhenTapped_InvokingLoginProcess() throws {
        // When
        let btnLogin  = try XCTUnwrap(stub.loginButton, "Login Button is not connected to IBOutlet")
        btnLogin.sendActions(for: .touchUpInside)
        // Then
        XCTAssert(presenter.isCalledLogin)
    }
    func testButtonRegister_WhenTapped_RegisterVCIsPushed() throws {
        // Arrange
        let window = UIWindow(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        // sut == system under test
        window.rootViewController = stub
        window.makeKeyAndVisible()
        // Act
        let btnRegister  = try XCTUnwrap(stub.createAccountButton, "Register Button is not connected to IBOutlet")
        btnRegister.sendActions(for: .touchUpInside)
        // Assert
        XCTAssertTrue(stub.presentedViewController is RegisterViewController)
    }
}
