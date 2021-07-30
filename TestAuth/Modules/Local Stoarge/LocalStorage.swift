//
//  LocalStorage.swift
//  TestAuth
//
//  Created by Ahmed Elesawy on 28/07/2021.
//

import Foundation
import RealmSwift

protocol LocalStorageProtocol {
    func addNewUser(_ user: UserModelProtocol, completion: (AppResponse<Bool>)-> Void)
    func getUserData(email: String, completion: (AppResponse<UserModelProtocol>)-> Void)
}

class LocalStorage: LocalStorageProtocol {
    var realm: Realm
    
    init() {
        do{
            self.realm = try Realm()
        }catch{
            fatalError()
        }
    }
    
    func addNewUser(_ user: UserModelProtocol, completion: (AppResponse<Bool>)-> Void) {
        guard !checkIfUserExist(email: user.email) else {
            completion(AppResponse.failure(.error))
            return
        }
        do{
            try realm.write {
                realm.add(user as! UserDataModel)
                completion(AppResponse.success(true))
            }
        }catch {
            completion(AppResponse.failure(.error))
        }
    }
    
    func getUserData(email: String, completion: (AppResponse<UserModelProtocol>)-> Void) {
        guard let user = realm.object(ofType: UserDataModel.self, forPrimaryKey: email) else {
            completion(AppResponse.failure(.userNotFound))
            return
        }
        completion(AppResponse.success(user))
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
