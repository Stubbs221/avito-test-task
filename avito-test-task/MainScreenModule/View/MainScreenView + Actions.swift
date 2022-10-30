//
//  MainScreenView + Actions.swift
//  avito-test-task
//
//  Created by Vasily Maslov on 30.10.2022.
//

import UIKit

extension MainScreenView {
    @objc func getDataButtonPressed() {
        self.companyData = nil
        self.loadingState = .loading
        self.output?.userPressedGetDataButton()
    }
    
    @objc func clearCacheButtonPressed() {
//        self.companyData = nil
        self.loadingState = .idle
        self.output?.userPressedClearCacheButton()
    }
}
