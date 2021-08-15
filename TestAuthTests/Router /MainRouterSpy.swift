//
//  MainRouterTests.swift
//  TestAuthTests
//
//  Created by Ahmed Elesawy on 11/08/2021.
//

import Foundation
import UIKit
@testable import TestAuth

class MainRouterSpy: MainRouter {
    // MARK: - Testing Properties
    var sourceViewController: UIViewController?
    var isCalledDismissViewController = false
    var isCalledPopViewController = false
    var isCalledShowAlert = false
    var isCalledPushViewController = false
    var isCalledPresentViewController = false
    var alertMessage = ""
    // MARK: - Spy Functions
    func dismissMe() {
        isCalledDismissViewController = true
    }
    func popMe() {
        isCalledPopViewController = true
    }
    func showAlert(message: String) {
        alertMessage = message
        isCalledShowAlert = true
    }
    func push(_ viewController: UIViewController) {
        isCalledPushViewController = true
    }
    func presentViewController(_ viewController: UIViewController) {
        isCalledPresentViewController = true
    }
}
