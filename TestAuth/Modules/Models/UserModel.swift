//
//  UsetInputForm.swift
//  TestAuth
//
//  Created by Ahmed Elesawy on 28/07/2021.
//

import Foundation

struct UserModel: UserModelProtocol, Equatable {
    var name: String = ""
    var phone: String = ""
    var email: String
    var password: String
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return  lhs.password == rhs.password
    }
    
}

