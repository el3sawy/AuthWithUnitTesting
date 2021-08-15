//
//  NavigationControllerSpy.swift
//  TestAuthTests
//
//  Created by Ahmed Elesawy on 04/08/2021.
//

import Foundation
import UIKit

class NavigationControllerSpy: UINavigationController {
    var pushedVC: UIViewController?
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushedVC = viewController
        super.pushViewController(viewController, animated: true)
    }
}
