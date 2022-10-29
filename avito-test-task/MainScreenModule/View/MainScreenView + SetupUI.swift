//
//  MainScreenView + SetupUI.swift
//  avito-test-task
//
//  Created by Vasily Maslov on 29.10.2022.
//

import UIKit

extension MainScreenView {
    func setupUI() {
        view.addSubview(employeesTableView)
        
        NSLayoutConstraint.activate([
            employeesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            employeesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            employeesTableView.topAnchor.constraint(equalTo: view.topAnchor),
            employeesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }
    
    func setupNavigation() {
        navigationController?.navigationBar.topItem?.title = "Avito-test-task"
    }
}

