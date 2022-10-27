//
//  ContentCollectionViewCell.swift
//  InstagramApp
//
//  Created by Daniil on 23.10.2022.
//

import UIKit

// Класс отвечает за ячейку CollectionView c изображением пользователя
final class ContentCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var profileImageView: UIImageView!
    
    // MARK: - Public methods
     func refresh(_ model: ProfilePhotos) {
        profileImageView.image = UIImage(named: model.imageViewName)
    }
}
