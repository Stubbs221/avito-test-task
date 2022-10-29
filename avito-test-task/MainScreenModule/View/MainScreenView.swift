//
//  ViewController.swift
//  avito-test-task
//
//  Created by Vasily Maslov on 29.10.2022.
//

import UIKit

protocol MainScreenViewInput: AnyObject {
    var output: MainScreenViewOutput? { get set }
    
    var companyData: Company? { get set }
    
    var loadingState: LoadingState { get set }
}

protocol MainScreenViewOutput {
    
}

class MainScreenView: UIViewController, MainScreenViewInput {

    var output: MainScreenViewOutput?
    
    var companyData: Company? {
        didSet {
            employeesTableView.reloadData()
        }
    }
    
    var loadingState: LoadingState = .idle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupNavigation()
    }

    lazy var employeesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(EmployeeCell.self, forCellReuseIdentifier: EmployeeCell.reuseIdentifier)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.hexStringToUIColor(hex: "fffcf2")
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
}

