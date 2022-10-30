//
//  MainScreenView + SetupUI.swift
//  avito-test-task
//
//  Created by Vasily Maslov on 29.10.2022.
//

import UIKit

extension MainScreenView {
    func setupUI() {
        view.backgroundColor = UIColor.hexStringToUIColor(hex: "ccc5b9")
//        view.backgroundColor = UIColor.hexStringToUIColor(hex: "403d39")
        view.addSubview(employeesTableView)
        view.addSubview(getDataButton)
        view.addSubview(clearCacheButton)
        view.addSubview(activityIndicator)
        view.addSubview(errorDescriptionLabel)
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
        
        NSLayoutConstraint.activate([
            errorDescriptionLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            errorDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            errorDescriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)])
        NSLayoutConstraint.activate([
            employeesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            employeesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            employeesTableView.topAnchor.constraint(equalTo: view.topAnchor),
            employeesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
        
        NSLayoutConstraint.activate([
            getDataButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            getDataButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -(UIScreen.main.bounds.width / 2) - 10 ),
            getDataButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            getDataButton.heightAnchor.constraint(equalToConstant: 60)])
        
        NSLayoutConstraint.activate([
            clearCacheButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            clearCacheButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  (UIScreen.main.bounds.width / 2) + 10 ),
            clearCacheButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            clearCacheButton.heightAnchor.constraint(equalToConstant: 60)])
        
    }
    

    func setupNavigation() {
        navigationController?.navigationBar.topItem?.title = "Avito-test-task"
//        navigationController?.navigationBar.backgroundColor = UIColor.hexStringToUIColor(hex: "252422")
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor.hexStringToUIColor(hex: "252422")
//        navigationController?.navigationBar.standardAppearance = appearance
//        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
}

