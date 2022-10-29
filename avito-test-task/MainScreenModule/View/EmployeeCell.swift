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
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    var skillsStackView: UIStackView!
    
    private func makeSkillLabel(with skill: String) -> UILabel {
        let label = UILabel()
        label.text = skill
        return label
    }
    
    func configureCell(with data: Employee) {
        var subviews: [UILabel] = []

        self.nameLabel.text = data.name
        self.phoneNumberLabel.text = data.phoneNumber
        
        for skill in data.skills {
            subviews.append(makeSkillLabel(with: skill))
        }
        self.skillsStackView = UIStackView(arrangedSubviews: subviews)
        self.skillsStackView.axis = .vertical
        self.skillsStackView.distribution = .equalSpacing
        self.skillsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(phoneNumberLabel)
        contentView.addSubview(skillsStackView)
        
        NSLayoutConstraint.activate([
            nameLabel.heightAnchor.constraint(equalToConstant: 40),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor)])
        NSLayoutConstraint.activate([
            phoneNumberLabel.heightAnchor.constraint(equalToConstant: 40),
            phoneNumberLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            phoneNumberLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor)])
        NSLayoutConstraint.activate([
            skillsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            skillsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            skillsStackView.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor),
            skillsStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)])
    }
}
