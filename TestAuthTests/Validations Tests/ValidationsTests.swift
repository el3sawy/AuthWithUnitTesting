//
//  ValidationsTests.swift
//  TestAuthTests
//
//  Created by Ahmed Elesawy on 29/07/2021.
//

import XCTest
@testable import TestAuth

class ValidationsTests: XCTestCase {
    var stub: Validations!
    override func setUpWithError() throws {
        stub = Validations()
    }
    override func tearDownWithError() throws {
        stub = nil
    }
    // MARK: - Test Mobile
    func test_mobile_mobileIsEmpty_returnEnterMobileMessage() {
        // Given
        let mobile = ""
        var authError =  AuthErrorEnum.emailEmpty
        // When and Then
        XCTAssertThrowsError(try stub.mobile(value: mobile)) { error in
            authError =  error as? AuthErrorEnum ?? .emailEmpty
        }
        XCTAssertEqual(authError.description, AuthErrorEnum.mobileEmpty.description)
    }
    func test_mobile_mobileIsNil_returnEnterMobileMessage() {
        // Given
        var authError =  AuthErrorEnum.emailEmpty
        // When and Then
        XCTAssertThrowsError(try stub.mobile(value: nil)) { error in
            authError =  error as? AuthErrorEnum ?? .emailEmpty
        }
        XCTAssertEqual(authError.description, AuthErrorEnum.mobileEmpty.description)
    }
    func test_mobile_mobileNotEmptyButLessThan11Number_returnNotValidMessage() {
        // Given
        let mobile = "01058585"
        var authError =  AuthErrorEnum.emailEmpty
        // When and Then
        XCTAssertThrowsError(try stub.mobile(value: mobile)) { error in
            authError =  error as? AuthErrorEnum ?? .emailEmpty
        }
        XCTAssertEqual(authError.description, AuthErrorEnum.mobileCount.description)
    }
    func test_mobile_mobileNotEmpty_returnSuccess() {
        // Given
        let mobile = "01012345698"
        let result = try? stub.mobile(value: mobile)
        // Then
        XCTAssertEqual(mobile, result)
    }
    // MARK: - Test Password
    func test_password_passwordIsEmpty_returnEnterPasswordMessage() {
        // Given
        let pass = ""
        var authError =  AuthErrorEnum.emailEmpty
        // When and Then
        XCTAssertThrowsError(try stub.password(value: pass)) { error in
            authError =  error as? AuthErrorEnum ?? .emailEmpty
        }
        XCTAssertEqual(authError.description, AuthErrorEnum.passwordEmpty.description)
    }
    func test_password_passwordIsNil_returnEnterPasswordMessage() {
        // Given
        var authError =  AuthErrorEnum.emailEmpty
        // When and Then
        XCTAssertThrowsError(try stub.password(value: nil)) { error in
            authError =  error as? AuthErrorEnum ?? .emailEmpty
        }
        XCTAssertEqual(authError.description, AuthErrorEnum.passwordEmpty.description)
    }
    func test_password_passwordNotEmptyButLessThan11Number_returnNotValidMessage() {
        // given
        let password = "123"
        var authError =  AuthErrorEnum.emailEmpty
        // when and then
        XCTAssertThrowsError(try stub.password(value: password)) { error in
            authError =  error as? AuthErrorEnum ?? .emailEmpty
        }
        XCTAssertEqual(authError.description, AuthErrorEnum.passwordCount.description)
    }
    func test_password_passwordNotEmpty_returnSuccess() {
        // Given
        let password = "ahmed Nageeb"
        let result = try? stub.password(value: password)
        // Then
        XCTAssertEqual(password, result)
    }
    // MARK: - Test Name
    func test_name_nameIsEmpty_returnNil() {
        // Given
        let name = ""
        // When
        let result = try? stub.name(value: name)
        // Then
        XCTAssertNil(result, "Must be nil because it empty")
    }
    func test_name_IsNil_returnNil() {
        // When
        let result = try? stub.name(value: nil)
        // Then
        XCTAssertNil(result, "Must be nil because it empty")
    }
    func test_name_IsEmpty_returnName() {
        // Given
        let name = "Ahmed"
        // When
        let result = try? stub.name(value: name)
        // Then
        XCTAssertNotNil(result, "Must has value")
        XCTAssertEqual(name, result ?? "")
    }
    // MARK: - Test Email
    func test_email_IsEmpty_returnNil() {
        // given
        let email = ""
        var authError =  AuthErrorEnum.mobileEmpty
        // When and Then
        XCTAssertThrowsError(try stub.email(value: email)) { error in
            authError =  error as? AuthErrorEnum ?? .mobileEmpty
        }
        XCTAssertEqual(authError, AuthErrorEnum.emailEmpty)
    }
    func test_email_IsNil_returnNil() {
        // Given
        var authError =  AuthErrorEnum.mobileEmpty
        // When and Then
        XCTAssertThrowsError(try stub.email(value: nil)) { error in
            authError =  error as? AuthErrorEnum ?? .mobileEmpty
        }
        XCTAssertEqual(authError.description, AuthErrorEnum.emailEmpty.description)
    }
    func test_emailHasValue_NotValidMail() {
        // Given
        let email = "ahmed@Vodafone"
        var authError =  AuthErrorEnum.mobileEmpty
        // When and Then
        XCTAssertThrowsError(try stub.email(value: email)) { error in
            authError =  error as? AuthErrorEnum ?? .mobileEmpty
        }
        XCTAssertEqual(authError.description, AuthErrorEnum.emailNotValid.description)
    }
    func test_email_HasValue_SuccessMail() {
        // Given
        let email = "ahmed@Vodafone.com"
        // When
        let result = try? stub.email(value: email)
        // Then
        XCTAssertEqual( result, email, "Must be Success ")
    }
}
