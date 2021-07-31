//
//  LoginViewPresenter.swift
//  TestAuth
//
//  Created by Ahmed Elesawy on 29/07/2021.
//

import Foundation
protocol LoginPresenterProtocol {
    func login(email: String?, password: String?)
}

class LoginPresenter: LoginPresenterProtocol {
    
    // MARK: - Dependencies
    private var repo: AuthRepositoryProtocol
    private weak var view: LoginViewProtocol?
    private var loginProcess: LoginProcessProtocol
    private var validator: ValidationsProtocol
    
    private var password: String = ""
    // MARK: - Initializers
    init(view: LoginViewProtocol, repo: AuthRepositoryProtocol, loginProcess: LoginProcessProtocol, validator:ValidationsProtocol) {
        self.view = view
        self.repo = repo
        self.loginProcess = loginProcess
        self.validator = validator
    }
    
}

//MARK:- Extensions
extension LoginPresenter {
    func login(email: String?, password: String?) {
        guard validation(mail: email, password: password) else {return}
        repo.getUser(email: email!) { [weak self] response in
            guard let self = self else {return}
            self.handleResponse(response)
        }
    }
    
    private func validation(mail: String?, password: String?) -> Bool {
        do {
            try validator.email(value: mail)
            let password = try validator.password(value: password)
            self.password = password
            return true
        }catch(let error) {
            guard let authError = error as? AuthErrorEnum else {return false}
            self.view?.showMessage(authError.description)
            return false
        }
    }
    
    private func handleResponse(_ response:  AppResponse<UserModel>) {
        let result = loginProcess.login(response, password: password)
        switch result {
        case .success(let value):
            self.view?.successLogin(user: value)
        case .failure(let error):
            self.view?.showMessage(error.description)
        }
    }
}
