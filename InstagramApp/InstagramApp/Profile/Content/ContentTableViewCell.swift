//
//  ContentTableViewCell.swift
//  InstagramApp
//
//  Created by Daniil on 23.10.2022.
//

import UIKit

// Класс отвечает за ячейку TableView с фотографиями пользователя
final class ContentTableViewCell: UITableViewCell {

    // MARK: - IBOutlet
    @IBOutlet weak private var contentCollectionView: UICollectionView!
    
    // MARK: - awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
        configCollectionView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Private methods
    private func configCollectionView() {
        contentCollectionView.delegate = self
        contentCollectionView.dataSource = self
    }
}

/// Constants
extension ContentTableViewCell {
    enum Constants {
        static let contentCellIdentifier = "content"
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension ContentTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.contentCellIdentifier, for: indexPath) as? ContentCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
}
