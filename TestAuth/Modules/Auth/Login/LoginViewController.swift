//
//  LoginViewController.swift
//  TestAuth
//
//  Created by Ahmed Elesawy on 29/07/2021.
//

import UIKit

protocol LoginViewProtocol: NSObject {
    func successLogin()
    func failedLogin(message: String)
}
class LoginViewController: UIViewController {

    @IBOutlet private weak var lblEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK:- Actions
    @IBAction func btnLoginTapped(_ sender: Any) {
        
    }
}

//MARK:- Extensions
extension LoginViewController: LoginViewProtocol {
    func successLogin() {
        
    }
    
    func failedLogin(message: String) {
        showAlert(message: message)
    }
}
