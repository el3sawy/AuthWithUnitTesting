//
//  LoginUseCase.swift
//  TestAuth
//
//  Created by Ahmed Elesawy on 09/08/2021.
//

import Foundation

protocol LoginUseCaseProtocol {
    func login(email: String, password: String, completion: @escaping (Result<UserModel>) -> Void)
}

class LoginUseCase: LoginUseCaseProtocol {
    // MARK: - Dependencies
    private var repository: AuthRepositoryProtocol
    private var loginProcess: LoginProcessProtocol
    // MARK: - Initializers
    init(authRepository: AuthRepositoryProtocol = AuthRepository(localStorage: LocalStorage()), loginProcess: LoginProcessProtocol = LoginProcess()) {
        self.repository = authRepository
        self.loginProcess = loginProcess
    }
    // MARK: - Functions 
    func login(email: String, password: String, completion: @escaping (Result<UserModel>) -> Void) {
        repository.getUser(email: email) { [weak self] response in
            guard let self = self else {return}
            let result = self.handleLoginResponse(response, password: password)
            completion(result)
        }
    }
    private func handleLoginResponse(_ response: Result<UserModel>, password: String) -> Result<UserModel> {
        let result = loginProcess.login(response, password: password)
        switch result {
        case .success(let value):
            return Result.success(value)
        case .failure(let error):
            return Result.failure(error)
        }
    }
}
