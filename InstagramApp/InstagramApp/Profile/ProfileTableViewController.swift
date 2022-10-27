//
//  ProfileTableViewController.swift
//  InstagramApp
//
//  Created by Daniil on 23.10.2022.
//

import UIKit

// Класс отвечает за страницу с профилем пользователя
final class ProfileTableViewController: UITableViewController {
    // MARK: - Visual Components

    private let refresControl = UIRefreshControl()

    // MARK: - Private properties

    private let cellsTypes: [CellsTypes] = [.profileInfo, .userInfo, .stories, .content]

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        refreshPageAction()
    }

    // MARK: - Private methods

    private func refreshPageAction() {
        refresControl.tintColor = .white
        refreshControl = refresControl
        Timer.scheduledTimer(timeInterval: 2,
                             target: self,
                             selector: #selector(endRefreshAction),
                             userInfo: nil, repeats: true)
    }

    @objc private func endRefreshAction() {
        refresControl.endRefreshing()
    }
}

/// Constants and CellTypes
extension ProfileTableViewController {
    enum Constants {
        static let profileInfoCellIdentifier = "profileInfo"
        static let descriptionCellIdentifier = "description"
        static let storiesCellIdentifier = "storiesCell"
        static let contentCellIdentifier = "content"
    }

    enum CellsTypes {
        case profileInfo
        case userInfo
        case stories
        case content
    }
}

// MARK: - UITableViewControllerDelegate, UITableViewControllerDataSource

extension ProfileTableViewController {
    override func numberOfSections(in _: UITableView) -> Int {
        return 4
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type = cellsTypes[indexPath.section]
        switch type {
        case .profileInfo:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.profileInfoCellIdentifier, for: indexPath)
            return cell
        case .userInfo:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.descriptionCellIdentifier, for: indexPath)
            return cell
        case .stories:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.storiesCellIdentifier, for: indexPath)
            return cell
        case .content:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.contentCellIdentifier, for: indexPath)
            return cell
        }
    }

    override func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
