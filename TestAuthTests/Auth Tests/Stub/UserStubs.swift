//
//  UserDataStub.swift
//  TestAuthTests
//
//  Created by Ahmed Elesawy on 29/07/2021.
//

import Foundation
@testable import TestAuth


struct UserStubs {
    static func createUser() -> UserModel {
        let user = UserModel(name: "Ahmed", phone: "01066336379", email: "ahmed@vois.com", password: "123456")
        return user
    }
    
}
