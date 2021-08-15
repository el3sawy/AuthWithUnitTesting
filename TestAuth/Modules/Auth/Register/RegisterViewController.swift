//
//  RegisterViewController.swift
//  TestAuth
//
//  Created by Ahmed Elesawy on 29/07/2021.
//

import UIKit

class RegisterViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet private(set) weak var nameTextField: UITextField!
    @IBOutlet private(set) weak var mobileTextField: UITextField!
    @IBOutlet private(set) weak var passwordTextField: UITextField!
    @IBOutlet private(set) weak var emailTextField: UITextField!
    @IBOutlet private(set) weak var registerButton: UIButton!
    @IBOutlet private(set) weak var dismissButton: UIButton!
    // MARK: - Variables
    var presenter: RegisterPresenterProtocol!
    // MARK: - Actions
    @IBAction private func buttonRegisterTapped(_ sender: Any) {
       var user = UserInputFormModel()
        user.name = nameTextField.text
        user.email = emailTextField.text
        user.password = passwordTextField.text
        user.phone = mobileTextField.text
        presenter.register(user: user)
    }
    @IBAction private func buttonDismissTapped(_ sender: Any) {
        presenter.dismiss()
    }
}
