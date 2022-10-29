//
//  MainScreenView + Extensions.swift
//  avito-test-task
//
//  Created by Vasily Maslov on 29.10.2022.
//

import UIKit

extension MainScreenView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let companyData = companyData else { return 0 }
        return companyData.employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeCell.reuseIdentifier, for: indexPath) as? EmployeeCell,
              let companyData = companyData else { return UITableViewCell() }
        cell.configureCell(with: companyData.employees[indexPath.row])
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let companyData = companyData else { return nil }
        return companyData.name
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80 + CGFloat((self.companyData?.employees[indexPath.row].skills.count)!) * 30
    }
}
