//
//  LoginViewController.swift
//  TestAuth
//
//  Created by Ahmed Elesawy on 29/07/2021.
//

import UIKit

class LoginViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet private(set) weak var emailTextField: UITextField!
    @IBOutlet private(set) weak var passwordTextField: UITextField!
    @IBOutlet private(set) weak var loginButton: UIButton!
    @IBOutlet private(set) weak var createAccountButton: UIButton!
    // MARK: - Variables
    var presenter: LoginPresenterProtocol!
    // MARK: - Actions
    @IBAction private func buttonLoginTapped(_ sender: UIButton) {
        presenter.login(email: emailTextField.text, password: passwordTextField.text)
    }
    @IBAction private func buttonCreateAccountTapped(_ sender: UIButton) {
        presenter.presentRegister()
    }
}
