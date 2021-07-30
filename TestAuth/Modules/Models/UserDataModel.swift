//
//  UserModel.swift
//  TestAuth
//
//  Created by Ahmed Elesawy on 28/07/2021.
//

import Foundation
import RealmSwift

protocol UserModelProtocol {
    var name: String {get set}
    var phone: String {get set}
    var email: String {get set}
    var password: String {get set}
}

class UserDataModel: Object, UserModelProtocol {
    @objc dynamic var name: String = ""
    @objc dynamic var phone: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var password: String = ""
    
    convenience init(name: String, phone: String, email: String, password: String) {
        self.init()
        self.name = name
        self.phone = phone
        self.email = email
        self.password = password
    }
    
    override class func primaryKey() -> String? {
        return  "email"
    }
}


