//
//  RegisterViewController.swift
//  TestAuth
//
//  Created by Ahmed Elesawy on 29/07/2021.
//

import UIKit

class RegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        let m = UserInputForm(name: "ahmed", phone: "aa", email: "sasa", password: "sasas")
       let l = LocalStorage()
        let user = UserModel(name: "ahme", phone: "55", email: "sasasas", password: "8888")
       let iss = l.addNewUser(user)
        print(iss)
        
//        let c = l.getUser(email: "sasa")
//        print(c)
    }

}
