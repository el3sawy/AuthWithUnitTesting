//
//  LoginViewController.swift
//  TestAuth
//
//  Created by Ahmed Elesawy on 29/07/2021.
//

import UIKit

protocol LoginViewProtocol: NSObject {
    func successLogin(user: UserModel)
    func showMessage(_ message: String)
}
class LoginViewController: UIViewController {
    
    @IBOutlet private weak var txtEmail: UITextField!
    @IBOutlet private weak var txtPassword: UITextField!
    
    var presenter: LoginPresenterProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- Actions
    @IBAction func btnLoginTapped(_ sender: Any) {
        presenter.login(email: txtEmail.text, password: txtPassword.text)
    }
    
    @IBAction func btnCreateAccountTapped(_ sender: Any) {
        let vc = AuthConfigurator.setVC(type: .register)
        push(vc)
    }
}

//MARK:- Extensions
extension LoginViewController: LoginViewProtocol {
    func successLogin(user: UserModel) {
        let vc = AuthConfigurator.setVC(type: .home(user: user.name))
        push(vc)
    }
    
    func showMessage(_ message: String) {
        showAlert(message: message)
    }
}
