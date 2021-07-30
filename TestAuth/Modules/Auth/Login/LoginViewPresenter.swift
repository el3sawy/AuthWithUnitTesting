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
}

class LoginViewPresenter: LoginViewPresenterProtocol {
    
    // MARK: - Dependencies
    var repo: AuthRepositoryProtocol
    weak var view: LoginViewProtocol?
    
    // MARK: - Initializers
    init(view: LoginViewProtocol, repo: AuthRepositoryProtocol) {
        self.view = view
        self.repo = repo
    }
}

//MARK:- Extensions
extension LoginViewPresenter {
    func login(email: String) {
        let response = repo.getUser(email: email)
        switch response {
        case .success(_):
            self.view?.successLogin()
        case .failure(let error):
            self.view?.failedLogin(message: error.description)
        }
    }
}
