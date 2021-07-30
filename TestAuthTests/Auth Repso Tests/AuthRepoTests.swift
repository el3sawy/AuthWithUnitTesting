//
//  AuthRepoTests.swift
//  TestAuthTests
//
//  Created by Ahmed Elesawy on 29/07/2021.
//

import XCTest
@testable import TestAuth

class AuthRepoTests: XCTestCase {
    
    var stub: AuthRepository!
    var localStorage: LocalStorageSpy!
    
    override func setUpWithError() throws {
        localStorage = LocalStorageSpy()
        stub = AuthRepository(localStorage: localStorage)
    }
    
    override func tearDownWithError() throws {
        stub = nil
        localStorage = nil
    }
    
    func test_AddNewUsersCalled_Success () {
        //given
        let user = UserStubs.createUser()
        // when
        let _ = stub.addNewUser(user)
        //Then
        XCTAssertTrue(localStorage.isCalledAddNewUser, "Add new user func not called")
    }
    
    func test_GetUsersIsCalled_Success() {
        //given
        let email = UserStubs.createUser().email
        
        // When
        let _ = stub.getUser(email: email)
    
        //Then
        XCTAssertTrue(localStorage.isCalleGetUserUser,  "Add get user data func not called")
        
    }
    
}
