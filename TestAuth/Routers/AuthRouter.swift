//
//  AuthRouter.swift
//  TestAuth
//
//  Created by Ahmed Elesawy on 09/08/2021.
//

import Foundation
import UIKit

protocol AuthRouterProtocol: MainRouter {
    func presentRegisterUser()
    func pushHomeViewController(user name: String)
}

class AuthRouter: AuthRouterProtocol {
   weak var sourceViewController: UIViewController?
    func presentRegisterUser() {
        let registerViewController = AuthConfigurator.getViewController(type: .register)
        presentViewController(registerViewController)
    }
    func pushHomeViewController(user name: String) {
        let home = AuthConfigurator.getViewController(type: .home(user: name))
        push(home)
    }
}
extension AuthRouterProtocol {
    func presentRegisterUser() {}
    func pushHomeViewController(user name: String) {}
}
