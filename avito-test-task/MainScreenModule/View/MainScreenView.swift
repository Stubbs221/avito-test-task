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
    var loadingState: LoadingState? { get set }
    func updateCompanyData(data: Company)

}

protocol MainScreenViewOutput {
    func userPressedGetDataButton()
    func userPressedClearCacheButton()
}

class MainScreenView: UIViewController, MainScreenViewInput {
    var output: MainScreenViewOutput?
    var companyData: Company? 
    
    var loadingState: LoadingState? {
        didSet {
            DispatchQueue.main.async {
                self.setLoadingState(with: self.loadingState)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadingState = .idle
        self.setupUI()
        self.setupNavigation()
        
    }
    
    lazy var employeesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(EmployeeCell.self, forCellReuseIdentifier: EmployeeCell.reuseIdentifier)
        tableView.register(EmployeeSectionHeader.self, forHeaderFooterViewReuseIdentifier: EmployeeSectionHeader.reuseIdentifier)
        tableView.sectionHeaderTopPadding = 0
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        tableView.separatorColor = UIColor.hexStringToUIColor(hex: "ccc5b9")
        tableView.backgroundColor = UIColor.hexStringToUIColor(hex: "fffcf2")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = true
        return tableView
    }()
    
    lazy var getDataButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Load data", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        button.layer.cornerRadius = 30
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.hexStringToUIColor(hex: "fffcf2").cgColor
        button.layer.shadowRadius = 7
        button.layer.shadowColor = UIColor.hexStringToUIColor(hex: "403d39").cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.backgroundColor = UIColor.hexStringToUIColor(hex: "403d39")
        button.setTitleColor(UIColor.hexStringToUIColor(hex: "fffcf2"), for: .normal)
        button.addTarget(self, action: #selector(getDataButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var clearCacheButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Clear cache", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        button.layer.cornerRadius = 30
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.hexStringToUIColor(hex: "fffcf2").cgColor
        button.layer.shadowRadius = 7
        button.layer.shadowColor = UIColor.hexStringToUIColor(hex: "403d39").cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.backgroundColor = UIColor.hexStringToUIColor(hex: "403d39")
        button.setTitleColor(UIColor.hexStringToUIColor(hex: "fffcf2"), for: .normal)
        button.addTarget(self, action: #selector(clearCacheButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView(style: .large)
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.color = UIColor.hexStringToUIColor(hex: "403d39")
        activity.isHidden = true
        return activity
    }()
    
    lazy var errorDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.hexStringToUIColor(hex: "403d39")
        label.isHidden = true
        label.numberOfLines = 3
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return label
    }()
    
    lazy var idleDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.hexStringToUIColor(hex: "403d39")
        label.isHidden = true
        label.numberOfLines = 3
        label.text = "Press 'Load data' button. \nCache expires automatically \nin 1 hour.\nAlso you can do it manually by pressing 'Clear cache' button"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return label
    }()
}

