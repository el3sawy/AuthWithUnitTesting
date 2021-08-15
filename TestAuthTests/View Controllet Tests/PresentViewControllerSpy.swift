//
//  PresentViewController.swift
//  TestAuthTests
//
//  Created by Ahmed Elesawy on 04/08/2021.
//

import Foundation
import UIKit
@testable import TestAuth

class PresentViewControllerSpy: LoginViewController {
    var presentVC: UIViewController?
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?) {
        presentVC = viewControllerToPresent
      }
}
