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
    
    
}
//MARK:- Test Name
extension ValidationsTests {
    func test_nameIsEmpty_returnNil() {
        //given
        let name = ""
        // when
        let result = try? stub.name(value: name)
        // Then
        XCTAssertNil(result, "Must be nil because it empty")
    }
    func test_nameIsNil_returnNil() {
        // when
        let result = try? stub.name(value: nil)
        // Then
        XCTAssertNil(result, "Must be nil because it empty")
    }
    
    func test_nameIsEmpty_returnName() {
        //given
        let name = "Ahmed"
        // when
        let result = try? stub.name(value: name)
        // Then
        XCTAssertNotNil(result, "Must has value")
        XCTAssertEqual(name, result ?? "")
    }
}

//MARK:- Test Email
extension ValidationsTests {
    func test_emailIsEmpty_returnNil() {
        //given
        let email = ""
        var authError =  AuthErrorEnum.mobileEmpty
        //when and then
        XCTAssertThrowsError(try stub.email(value: email)) { error in
           authError =  error as! AuthErrorEnum
        }
        XCTAssertEqual(authError.description, AuthErrorEnum.emailEmpty.description)
    }
    
    func test_emailIsNil_returnNil() {
        //given
        var authError =  AuthErrorEnum.mobileEmpty
        //when and then
        XCTAssertThrowsError(try stub.email(value: nil)) { error in
           authError =  error as! AuthErrorEnum
        }
        XCTAssertEqual(authError.description, AuthErrorEnum.emailEmpty.description)
    }
    func test_emailHasValue_NotValidMail() {
        //given
        let email = "ahmed@Vodafone"
        var authError =  AuthErrorEnum.mobileEmpty
        //when and then
        XCTAssertThrowsError(try stub.email(value: email)) { error in
           authError =  error as! AuthErrorEnum
        }
        XCTAssertEqual(authError.description, AuthErrorEnum.emailNotValid.description)
    }
    
    func test_emailHasValue_SuccessMail() {
        //given
        let email = "ahmed@Vodafone.com"
        //when
        let result = try? stub.email(value: email)
       //Then
        XCTAssertEqual( result, email, "Must be Success ")
    }
}

// MARK:- Test Mobile
extension ValidationsTests {
    func test_mobileIsEmpty_returnEnterMobileMessage() {
        //given
        let mobile = ""
        var authError =  AuthErrorEnum.emailEmpty
        //when and then
        XCTAssertThrowsError(try stub.mobile(value: mobile)) { error in
           authError =  error as! AuthErrorEnum
        }
        XCTAssertEqual(authError.description, AuthErrorEnum.mobileEmpty.description)
    }
    
    func test_mobileIsNil_returnEnterMobileMessage() {
        //given
        var authError =  AuthErrorEnum.emailEmpty
        //when and then
        XCTAssertThrowsError(try stub.mobile(value: nil)) { error in
           authError =  error as! AuthErrorEnum
        }
        XCTAssertEqual(authError.description, AuthErrorEnum.mobileEmpty.description)
    }
    
    func test_mobileNotEmptyButLessThan11Number_returnNotValidMessage() {
        //given
        let mobile = "01058585"
        var authError =  AuthErrorEnum.emailEmpty
        //when and then
        XCTAssertThrowsError(try stub.mobile(value: mobile)) { error in
           authError =  error as! AuthErrorEnum
        }
        XCTAssertEqual(authError.description, AuthErrorEnum.mobileCount.description)
    }
    
    
    func test_mobileNotEmpty_returnSuccess() {
        //given
        let mobile = "01012345698"
        let result = try? stub.mobile(value: mobile)
        XCTAssertEqual(mobile, result)
    }
}

// MARK:- Test Password
extension ValidationsTests {
    func test_passwordIsEmpty_returnEnterPasswordMessage() {
        //given
        let pass = ""
        var authError =  AuthErrorEnum.emailEmpty
        //when and then
        XCTAssertThrowsError(try stub.password(value: pass)) { error in
           authError =  error as! AuthErrorEnum
        }
        XCTAssertEqual(authError.description, AuthErrorEnum.passwordEmpty.description)
    }
    
    func test_passwordIsNil_returnEnterPasswordMessage() {
        //given
        let pass = ""
        var authError =  AuthErrorEnum.emailEmpty
        //when and then
        XCTAssertThrowsError(try stub.password(value: nil)) { error in
           authError =  error as! AuthErrorEnum
        }
        XCTAssertEqual(authError.description, AuthErrorEnum.passwordEmpty.description)
    }
    
    func test_passwordNotEmptyButLessThan11Number_returnNotValidMessage() {
        //given
        let pass = "123"
        var authError =  AuthErrorEnum.emailEmpty
        //when and then
        XCTAssertThrowsError(try stub.password(value: pass)) { error in
           authError =  error as! AuthErrorEnum
        }
        XCTAssertEqual(authError.description, AuthErrorEnum.passwordCount.description)
    }
    
    
    func test_passwordNotEmpty_returnSuccess() {
        //given
        let pass = "ahmed Nageeb"
        let result = try? stub.password(value: pass)
        XCTAssertEqual(pass, result)
    }
}
