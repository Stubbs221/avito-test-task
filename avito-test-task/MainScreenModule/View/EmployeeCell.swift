//
//  EmployeeCell.swift
//  avito-test-task
//
//  Created by Vasily Maslov on 29.10.2022.
//

import UIKit

class EmployeeCell: UITableViewCell {
    static let reuseIdentifier = "Cell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    lazy var nameTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Name:"
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = UIColor.hexStringToUIColor(hex: "403d39")
        return label
    }()
    
    lazy var phoneNumberTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.hexStringToUIColor(hex: "403d39")
        label.text = "Phone number:"
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.hexStringToUIColor(hex: "252422")
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    lazy var phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textColor = UIColor.hexStringToUIColor(hex: "252422")
        return label
    }()
    
    lazy var employeesSkills: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.text = "Employee's skills"
        return label
    }()
    
    var skillsStackView: UIStackView!
    
    private func makeSkillLabel(with skill: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        label.textColor = UIColor.hexStringToUIColor(hex: "403d39")
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.text = skill
        return label
    }
    
    private func makeStackView(with arrangedSubviews: [UILabel]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.layer.cornerRadius = 10
        stackView.layer.borderColor = UIColor.hexStringToUIColor(hex: "ccc5b9").cgColor
        stackView.layer.borderWidth = 1
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }
    
    override func prepareForReuse() {
        self.phoneNumberLabel.text = ""
        self.phoneNumberLabel.text = ""
        self.skillsStackView.removeFromSuperview()
    }
    
    func configureCell(with data: Employee) {
        contentView.backgroundColor = UIColor.hexStringToUIColor(hex: "fffcf2")
        
        var subviews: [UILabel] = []

        self.nameLabel.text = data.name
        self.phoneNumberLabel.text = data.phoneNumber
        
        for skill in data.skills {
            subviews.append(makeSkillLabel(with: skill))
        }
        
        self.skillsStackView = makeStackView(with: subviews)
        
        contentView.addSubview(nameTitleLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(phoneNumberTitleLabel)
        contentView.addSubview(phoneNumberLabel)
        contentView.addSubview(skillsStackView)
        
        NSLayoutConstraint.activate([
            nameTitleLabel.heightAnchor.constraint(equalToConstant: 40),
            nameTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            nameTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor)])
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 40),
            nameLabel.leadingAnchor.constraint(equalTo: nameTitleLabel.trailingAnchor, constant: 90)])
        NSLayoutConstraint.activate([
            phoneNumberTitleLabel.heightAnchor.constraint(equalToConstant: 40),
            phoneNumberTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            phoneNumberTitleLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor)])
        NSLayoutConstraint.activate([
            phoneNumberLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            phoneNumberLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            phoneNumberLabel.heightAnchor.constraint(equalToConstant: 40)])
        NSLayoutConstraint.activate([
            skillsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            skillsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            skillsStackView.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor),
            skillsStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)])
    }
}
