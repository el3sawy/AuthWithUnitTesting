//
//  LoginViewPresenter.swift
//  TestAuth
//
//  Created by Ahmed Elesawy on 29/07/2021.
//

import Foundation
protocol LoginPresenterProtocol {
    func login(email: String?, password: String?)
    func presentRegister()
}

class LoginPresenter {
    // MARK: - Dependencies
    private var loginUseCase: LoginUseCaseProtocol
    private var validator: ValidationsProtocol
    private var router: AuthRouterProtocol
    // MARK: - Initializers
    init(loginUseCase: LoginUseCaseProtocol, validator: ValidationsProtocol, router: AuthRouterProtocol) {
        self.loginUseCase = loginUseCase
        self.validator = validator
        self.router = router
    }
}

// MARK: - Extensions
extension LoginPresenter: LoginPresenterProtocol {
    func login(email: String?, password: String?) {
        guard validation(mail: email, password: password) else {return}
        loginUseCase.login(email: email!, password: password!) { [weak self] response in
            guard let self = self else {return}
            self.handleLoginResponse(response)
        }
    }
    private func validation(mail: String?, password: String?) -> Bool {
        do {
            try validator.email(value: mail)
            try validator.password(value: password)
            return true
        } catch {
            guard let authError = error as? AuthErrorEnum else {return false}
            self.router.showAlert(message: authError.description)
            return false
        }
    }
    private func handleLoginResponse(_ response: Result<UserModel>) {
        switch response {
        case .success(let value):
            router.pushHomeViewController(user: value.name)
        case .failure(let error):
            router.showAlert(message: error.description)
        }
    }
    func presentRegister() {
        router.presentRegisterUser()
    }
}
