//
//  LocalStorage.swift
//  TestAuth
//
//  Created by Ahmed Elesawy on 28/07/2021.
//

import Foundation
import RealmSwift

protocol LocalStorageProtocol {
    func addNewUser(_ user: UserModel) -> AppResponse<Bool>
    func getUser(email: String) -> AppResponse<UserModel>
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
    
    func addNewUser(_ user: UserModel) -> AppResponse<Bool> {
        guard !checkIfUserExist(email: user.email) else {
            return AppResponse.failure(.userExist)
        }
        
        var response =  AppResponse.success(false)
        do{
            try realm.write {
                realm.add(user)
                response = AppResponse.success(true)
            }
        }catch {
            response = AppResponse.failure(.error)
        }
        
        return response
    }
    
    func getUser(email: String) -> AppResponse<UserModel>  {
        guard let user = realm.object(ofType: UserModel.self, forPrimaryKey: email) else {
            return AppResponse.failure(.userNotFound)
        }
        return AppResponse.success(user)
    }
    
    private func checkIfUserExist(email: String) -> Bool {
        let response = getUser(email: email)
        
        switch response {
        case .success(_):
            return true
        case .failure(_):
            return false
        }
    }
}
