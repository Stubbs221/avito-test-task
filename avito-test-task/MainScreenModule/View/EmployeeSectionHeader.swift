//
//  EmployeeSectionHeader.swift
//  avito-test-task
//
//  Created by Vasily Maslov on 29.10.2022.
//

import UIKit

class EmployeeSectionHeader: UITableViewHeaderFooterView {

   static let reuseIdentifier = "Header"
    
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label
        return label
    }()

}
