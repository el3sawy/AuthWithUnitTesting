//
//  LoginViewPresenter.swift
//  TestAuth
//
//  Created by Ahmed Elesawy on 29/07/2021.
//

import Foundation
protocol LoginViewPresenterProtocol {
    var repo: AuthRepositoryProtocol {get}
    var view: LoginViewProtocol? {get}
    var loginProcess: LoginProcessProtocol {get}
}

class LoginViewPresenter: LoginViewPresenterProtocol {
    
    // MARK: - Dependencies
    var repo: AuthRepositoryProtocol
    weak var view: LoginViewProtocol?
    var loginProcess: LoginProcessProtocol
    
    // MARK: - Initializers
    init(view: LoginViewProtocol, repo: AuthRepositoryProtocol, loginProcess: LoginProcessProtocol) {
        self.view = view
        self.repo = repo
        self.loginProcess = loginProcess
    }
}

//MARK:- Extensions
extension LoginViewPresenter {
    func login(email: String) {
        
    }
}
