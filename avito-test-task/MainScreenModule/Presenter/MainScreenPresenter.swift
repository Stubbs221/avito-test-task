//
//  MainScreenPresenter.swift
//  avito-test-task
//
//  Created by Vasily Maslov on 29.10.2022.
//

import UIKit

protocol MainScreenPresenterInput {
    var view: MainScreenViewInput! { get set }
    var interactor: MainScreenInteractorInput { get set }
    var router: MainScreenRouterInput { get set }
    
    init(view: MainScreenViewInput, interactor: MainScreenInteractorInput, router: MainScreenRouterInput)
}

final class MainScreenPresenter: MainScreenPresenterInput {
    weak var view: MainScreenViewInput!
    
    var interactor: MainScreenInteractorInput
    
    var router: MainScreenRouterInput
    
    init(view: MainScreenViewInput, interactor: MainScreenInteractorInput, router: MainScreenRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
        
        
    }
    
    
}

extension MainScreenPresenter: MainScreenViewOutput {
    func userPressedGetDataButton() {
        interactor.fetchCompanyData()
    }
    
    func userPressedClearCacheButton() {
        interactor.clearCache()
    }
    
}

extension MainScreenPresenter: MainScreenInteractorOutput {
    func interactorDidFetchCompanyData(with state: LoadingState) {
        switch state {
        case .loaded(let companyData):
            self.view.updateCompanyData(data: Company(
                name: companyData.name,
                employees: companyData.employees.sorted {
                    $0.name > $1.name
                })
            )
        default:
            self.view.loadingState = state
        }
    }
    
    
}
