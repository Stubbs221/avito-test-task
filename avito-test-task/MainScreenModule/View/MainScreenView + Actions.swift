//
//  MainScreenView + Actions.swift
//  avito-test-task
//
//  Created by Vasily Maslov on 30.10.2022.
//

import UIKit

extension MainScreenView {
    
    
    
    func setLoadingState(with loadingState: LoadingState?) {
        guard let loadingState = loadingState else { return }
        switch loadingState {
        case .loaded(let companyData):
            self.companyData = companyData
        case .failure(let error):
            self.employeesTableView.isHidden = true
            self.activityIndicator.isHidden = true
            self.activityIndicator.stopAnimating()
            self.errorDescriptionLabel.text = error.description
            self.errorDescriptionLabel.isHidden = false
            self.idleDescriptionLabel.isHidden = true
        case .loading:
            self.employeesTableView.isHidden = true
            self.activityIndicator.isHidden = false
            self.errorDescriptionLabel.isHidden = true
            self.idleDescriptionLabel.isHidden = true
            self.activityIndicator.startAnimating()
        case .idle:
            self.idleDescriptionLabel.isHidden = false
            self.errorDescriptionLabel.isHidden = true
            self.employeesTableView.isHidden = true
            self.activityIndicator.isHidden = true
        }
    }
    
    func updateCompanyData(data: Company) {
        self.companyData = data
        employeesTableView.reloadData()
        idleDescriptionLabel.isHidden = true
        activityIndicator.isHidden = true
        errorDescriptionLabel.isHidden = true
        employeesTableView.isHidden = false
    }
    
    @objc func getDataButtonPressed() {
        self.companyData = nil
        self.loadingState = .loading
        self.output?.userPressedGetDataButton()
    }
    
    @objc func clearCacheButtonPressed() {
        self.loadingState = .idle
        self.output?.userPressedClearCacheButton()
    }
}
