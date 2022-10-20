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
    @IBOutlet weak private var objectImageView: UIImageView!
    @IBOutlet weak private var actionLabel: UILabel!
    @IBOutlet weak private var profileImageView: UIImageView!
    
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
    }
    
    public func refresh(_ model: ActionsModel) {
        profileImageView.image = UIImage(named: model.profileImageName)
        actionLabel.text = model.actionText
        objectImageView.image = UIImage(named: model.objectName)
        whenActionWas.text = model.whenAction
    }
}
