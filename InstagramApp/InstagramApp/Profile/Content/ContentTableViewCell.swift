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
    @IBOutlet private var contentCollectionView: UICollectionView!
    
    // MARK: - Private properties
    private var profilePhotos: [ProfilePhotos] = []

    // MARK: - awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
        configCollectionView()
        createProfileImages()
    }

    // MARK: - Private methods
    private func configCollectionView() {
        contentCollectionView.delegate = self
        contentCollectionView.dataSource = self
    }
    
    private func createProfileImages() {
        let firstPhoto = ProfilePhotos(imageViewName: Constants.sunImageName)
        let secondPhoto = ProfilePhotos(imageViewName: Constants.muskImagename)
        let thirdPhoto = ProfilePhotos(imageViewName: Constants.sunImageName)
        let fourPhoto = ProfilePhotos(imageViewName: Constants.muskImagename)
        let fivePhoto = ProfilePhotos(imageViewName: Constants.elonImageName)
        let sixPhoto = ProfilePhotos(imageViewName: Constants.muskImagename)
        let sevenPhoto = ProfilePhotos(imageViewName: Constants.sunImageName)
        let eightPhoto = ProfilePhotos(imageViewName: Constants.muskImagename)
        let ninePhoto = ProfilePhotos(imageViewName: Constants.elonImageName)
        let tenPhoto = ProfilePhotos(imageViewName: Constants.muskImagename)
        
        profilePhotos.append(firstPhoto)
        profilePhotos.append(secondPhoto)
        profilePhotos.append(thirdPhoto)
        profilePhotos.append(fourPhoto)
        profilePhotos.append(fivePhoto)
        profilePhotos.append(sixPhoto)
        profilePhotos.append(sevenPhoto)
        profilePhotos.append(eightPhoto)
        profilePhotos.append(ninePhoto)
        profilePhotos.append(tenPhoto)
    }
}

/// Constants
extension ContentTableViewCell {
    enum Constants {
        static let contentCellIdentifier = "content"
        static let sunImageName = "sun"
        static let muskImagename = "musk"
        static let elonImageName = "em3"
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension ContentTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return profilePhotos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.contentCellIdentifier, for: indexPath) as? ContentCollectionViewCell else { return UICollectionViewCell() }
        let item = profilePhotos[indexPath.row]
        cell.refresh(item)
        return cell
    }
}
