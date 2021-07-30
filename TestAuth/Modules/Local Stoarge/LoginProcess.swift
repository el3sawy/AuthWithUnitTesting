//
//  LoginProcess.swift
//  TestAuth
//
//  Created by Ahmed Elesawy on 30/07/2021.
//

import Foundation
protocol LoginProcessProtocol {
    var email: String {get}
    var password: String {get}
    func login(_ response: AppResponse<UserModelProtocol>) -> AppResponse<UserModelProtocol>
}

struct LoginProcess: LoginProcessProtocol {
    var email: String
    var password: String
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
    func login(_ response: AppResponse<UserModelProtocol>) -> AppResponse<UserModelProtocol>  {
        return handleLoginResponse(response)
    }
    
    private func handleLoginResponse(_ response: AppResponse<UserModelProtocol>) -> AppResponse<UserModelProtocol> {
        
        switch response {
        
        case .success(let user):
            let result = checkIsMailAndPasswordIsCorrect(user: user)
            guard result  else {
                return AppResponse.failure(.invalidUser)
            }
            return AppResponse.success(user)
        case .failure(_):
            return AppResponse.failure(.userNotFound)
        }
    }
    
    private func checkIsMailAndPasswordIsCorrect(user: UserModelProtocol) -> Bool {
        let userModel = UserModel(email: email, password: password)
        if userModel == user as! UserModel {
            return true
        }else {
            return false
        }
    }
}
