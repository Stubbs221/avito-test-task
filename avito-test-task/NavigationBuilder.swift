//
//  NavigationBuilder.swift
//  avito-test-task
//
//  Created by Vasily Maslov on 29.10.2022.
//

import UIKit

typealias NavigationFactory = (UIViewController) -> (UINavigationController)

class NavigationBuilder {
    static func build(rootView: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootView)
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.barStyle = .default
        let largeTextStyleAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black]
        navigationController.navigationBar.largeTitleTextAttributes = largeTextStyleAttributes
        

        
        
        
        
        return navigationController
    }
}
