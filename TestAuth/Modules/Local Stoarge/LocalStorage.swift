//
//  LocalStorage.swift
//  TestAuth
//
//  Created by Ahmed Elesawy on 28/07/2021.
//

import Foundation
import RealmSwift

protocol LocalStorageProtocol {
    func addNewUser(_ user: UserModel, completion: (Result<Bool>) -> Void)
    func getUserData(email: String, completion: (Result<UserModel>) -> Void)
}

class LocalStorage: LocalStorageProtocol {
    var realm: Realm
    init() {
        do {
            self.realm = try Realm()
        } catch {
            fatalError()
        }
    }
    func addNewUser(_ user: UserModel, completion: (Result<Bool>) -> Void) {
        guard !checkIfUserExist(email: user.email) else {
            completion(Result.failure(.userExist))
            return
        }
        do {
            try realm.write {
                realm.add(user)
                completion(Result.success(true))
            }
        } catch {
            completion(Result.failure(.error))
        }
    }
    func getUserData(email: String, completion: (Result<UserModel>) -> Void) {
        guard let user = realm.object(ofType: UserModel.self, forPrimaryKey: email) else {
            completion(Result.failure(.userNotFound))
            return
        }
        completion(Result.success(user))
    }
    private func checkIfUserExist(email: String) -> Bool {
        var isUserExist: Bool = false
        getUserData(email: email) { response in
            switch response {
            case .success(_):
                isUserExist = true
            case .failure(_):
                isUserExist = false
            }
        }
        return isUserExist
    }
}
