//
//  MainScreenModuleBuilder.swift
//  avito-test-task
//
//  Created by Vasily Maslov on 29.10.2022.
//

import UIKit

class MainScreenModuleConfigurator {
    class func build(usingNavigationFactory factory: NavigationFactory) -> UIViewController {
        let view = MainScreenView()
        let interactor = MainScreenInteractor()
        let router = MainScreenRouter()
        
        let presenter = MainScreenPresenter(view: view, interactor: interactor, router: router)
        view.output = presenter
        interactor.output = presenter
        router.rootVC = view
        
        return factory(view)
    }
}
