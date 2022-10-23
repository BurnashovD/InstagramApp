//
//  ActionsTableViewCell.swift
//  InstagramApp
//
//  Created by Daniil on 20.10.2022.
//

import UIKit

// Класс отвечает за ячейку с Действиями
final class ActionsTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak private var whenActionWas: UILabel!
    @IBOutlet weak private var actionLabel: UILabel!
    @IBOutlet weak private var profileImageView: UIImageView!
    @IBOutlet weak var objectButton: UIButton!
    
    // MARK: - awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        configImageView()
    }
    
    // MARK: - Private methods
    private func configImageView() {
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        objectButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public func refresh(_ model: Action) {
        profileImageView.image = UIImage(named: model.profileImageName)
        actionLabel.text = model.actionText
        objectButton.setBackgroundImage(UIImage(named: model.objectName), for: .normal)
        whenActionWas.text = model.whenAction
        
        if model.subButton == true {
            objectButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8).isActive = true
            objectButton.centerYAnchor.constraint(equalTo: actionLabel.centerYAnchor).isActive = true
            objectButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
            objectButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
            objectButton.backgroundColor = UIColor(named: Constants.buttonColorName)
            objectButton.setBackgroundImage(nil, for: .normal)
            objectButton.layer.cornerRadius = 5
            objectButton.setTitle(Constants.subscribeText, for: .normal)
            objectButton.tintColor = .white
        } else {
            objectButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
            objectButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
            objectButton.widthAnchor.constraint(equalToConstant: 55).isActive = true
            objectButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
            objectButton.centerYAnchor.constraint(equalTo: actionLabel.centerYAnchor).isActive = true
            objectButton.isUserInteractionEnabled = false
        }
    }
}

/// Constants
extension ActionsTableViewCell {
    enum Constants {
        static let buttonColorName = "buttonColor"
        static let subscribeText = "Подписаться"
    }
}
