//
//  RegisterPresenter.swift
//  TestAuth
//
//  Created by Ahmed Elesawy on 31/07/2021.
//

import Foundation
protocol RegisterPresenterProtocol {
    func register(user: UserInputFormModel)
    func dismiss()
}

class RegisterPresenter {
    // MARK: - Dependencies
    private var repo: AuthRepositoryProtocol
    private var validator: ValidationsProtocol
    private var router: AuthRouterProtocol
    // MARK: - Initializers
    init(repo: AuthRepositoryProtocol, validator: ValidationsProtocol, router: AuthRouterProtocol) {
        self.repo = repo
        self.validator = validator
        self.router = router
    }
}
// MARK: - Extension
extension RegisterPresenter: RegisterPresenterProtocol {
    func register(user: UserInputFormModel) {
        guard let userModel = validation(user: user) else {return}
        repo.addNewUser(userModel) { [weak self] response in
            guard let self = self else {return}
            switch response {
            case .success(_):
                self.router.pushHomeViewController(user: userModel.name)
            case .failure(let error):
                self.router.showAlert(message: error.description)
            }
        }
    }
    private func validation(user: UserInputFormModel) -> UserModel? {
        do {
            try validator.name(value: user.name)
            try validator.mobile(value: user.phone)
            try validator.email(value: user.email)
            try validator.password(value: user.password)
            let userModel = UserModel(user: user)
            return userModel
        } catch {
            guard let authError = error as? AuthErrorEnum else {return nil}
            self.router.showAlert(message: authError.description)
            return nil
        }
    }
    func dismiss() {
        router.dismissMe()
    }
}
