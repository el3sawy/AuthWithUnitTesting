//
//  UserModel.swift
//  TestAuth
//
//  Created by Ahmed Elesawy on 28/07/2021.
//

import Foundation
import RealmSwift

class UserModel: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var phone: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var password: String = ""
    convenience init(user: UserInputFormModel) {
        self.init()
        self.name = user.name ?? ""
        self.phone = user.phone ?? ""
        self.email = user.email ?? ""
        self.password = user.password ?? ""
    }
    override class func primaryKey() -> String? {
        return  "email"
    }
    static func == (lhs: UserModel, rhs: UserModel) -> Bool {
        return  lhs.password == rhs.password
    }
}
