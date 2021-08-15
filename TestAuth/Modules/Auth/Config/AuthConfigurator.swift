//
//  Authonfigurator.swift
//  TestAuth
//
//  Created by Ahmed Elesawy on 31/07/2021.
//

import Foundation
import UIKit

enum AuthConfiguratorType {
    case login
    case register
    case home(user: String)
}
struct AuthConfigurator {
    static func getViewController(type: AuthConfiguratorType) -> UIViewController {
        switch type {
        case .login:
            return login()
        case .register:
            return register()
        case .home(user: let user):
            return home(user: user)
        }
    }
    private static func register() -> UIViewController {
        let localStorage = LocalStorage()
        let repo = AuthRepository(localStorage: localStorage)
        let view = RegisterViewController()
        let validator = Validations()
        let router = AuthRouter()
        router.sourceViewController = view
        let presenter = RegisterPresenter(repo: repo, validator: validator, router: router)
        view.presenter = presenter
        return view
    }
    private static func login() -> UIViewController {
        let localStorage = LocalStorage()
        let repo = AuthRepository(localStorage: localStorage)
        let view = LoginViewController()
        let validator = Validations()
        let loginPrecess = LoginProcess()
        let loginUseCase = LoginUseCase(authRepository: repo, loginProcess: loginPrecess)
        let router = AuthRouter()
        router.sourceViewController = view
        let presenter = LoginPresenter(loginUseCase: loginUseCase, validator: validator, router: router)
        view.presenter = presenter
        return view
    }
    private static func home(user name: String) -> UIViewController {
        return HomeViewController(name: name)
    }
}
