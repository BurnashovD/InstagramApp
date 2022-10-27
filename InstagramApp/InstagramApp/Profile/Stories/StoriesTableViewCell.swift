//
//  StoriesTableViewCell.swift
//  InstagramApp
//
//  Created by Daniil on 23.10.2022.
//

import UIKit

// Класс истории ячейки TableView
final class StoriesTableViewCell: UITableViewCell {
    // MARK: - IBOutlet

    @IBOutlet private var storiesColectionView: UICollectionView!

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
        storiesColectionView.delegate = self
        storiesColectionView.dataSource = self
    }
}

/// Constants
extension StoriesTableViewCell {
    enum Constants {
        static let storiesCellIdentifier = "stories"
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension StoriesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return 15
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.storiesCellIdentifier, for: indexPath) as? StoriesCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
}
