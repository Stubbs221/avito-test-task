//
//  MainScreenIteractor.swift
//  avito-test-task
//
//  Created by Vasily Maslov on 29.10.2022.
//

import UIKit

protocol MainScreenInteractorInput {
    var output: MainScreenInteractorOutput? { get set }
    
    func fetchCompanyData()
    
    func clearCache()
}

protocol MainScreenInteractorOutput: AnyObject {
    func interactorDidFetchCompanyData(with state: LoadingState)
}

final class MainScreenInteractor: MainScreenInteractorInput {
    func clearCache() {
        JsonManager.shared.deleteJSON()
    }
    
    
    func fetchCompanyData() {
        NetworkService.shared.downloadJSON() { loadingState in
            self.output?.interactorDidFetchCompanyData(with: loadingState)
        }
    }
    
    weak var output: MainScreenInteractorOutput?
}
