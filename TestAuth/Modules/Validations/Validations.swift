//
//  Validations.swift
//  TestAuth
//
//  Created by Ahmed Elesawy on 29/07/2021.
//

import Foundation
protocol ValidationsProtocol {
    func name(value: String?)throws -> String
    func mobile(value:String?)throws -> String
    func email(value:String?)throws -> String
    func password(value:String?)throws -> String
}

class Validations: ValidationsProtocol {
    
    func name(value: String?)throws -> String {
        guard !(value?.isEmpty ?? true)  else {
            throw AuthErrorEnum.nameEmpty
        }
        return value!
    }
    
    func mobile(value:String?)throws -> String {
        guard !(value?.isEmpty ?? true) else{
            throw AuthErrorEnum.mobileEmpty
        }
        
        guard value!.count == 11 else  {
            throw AuthErrorEnum.mobileCount
        }
        return value!
    }
    
    func email(value:String?)throws -> String {
        guard !(value?.isEmpty ?? true)  else{
            throw AuthErrorEnum.emailEmpty
        }
        guard isValidEmail(testStr: value!) else {
            throw AuthErrorEnum.emailNotValid
        }
        return value!
    }
    
    func password(value:String?)throws -> String {
        guard !(value?.isEmpty ?? true) else{
            throw AuthErrorEnum.passwordEmpty
        }
        guard value!.count > 6 else {
            throw AuthErrorEnum.passwordCount
        }
        return value!
    }
}

extension Validations {
   private func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
}
