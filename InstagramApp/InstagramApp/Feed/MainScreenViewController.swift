//
//  ViewController.swift
//  InstagramApp
//
//  Created by Daniil on 17.10.2022.
//

import UIKit

// Основная лента с фото
final class MainScreenViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var navigationTitleLabel: UILabel!

    // MARK: - Private properties

    private let refreshControl = UIRefreshControl()
    private let tableCellsTypes: [TableCellsTypes] = [.stories, .post, .recomendations, .secondPost, .thirdPost]

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configNavBar()
        refreshPageAction()
    }

    // MARK: - Private methods

    private func configNavBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: navigationTitleLabel)
    }

    private func refreshPageAction() {
        tableView.refreshControl = refreshControl
        refreshControl.tintColor = .white
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(endRefreshAtion), userInfo: nil, repeats: true)
    }

    @objc private func endRefreshAtion() {
        refreshControl.endRefreshing()
    }
}

/// Constants
extension MainScreenViewController {
    enum Constants {
        static let storiesCellIdentifier = "stories"
        static let postCellIdentifier = "post"
        static let recomendatCellIdentifier = "recomendations"
        static let storiesCellHeight: CGFloat = 110
    }

    enum TableCellsTypes {
        case stories
        case post
        case recomendations
        case secondPost
        case thirdPost
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension MainScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type = tableCellsTypes[indexPath.row]
        switch type {
        case .stories:
            return tableView.dequeueReusableCell(withIdentifier: Constants.storiesCellIdentifier, for: indexPath)
        case .post, .secondPost, .thirdPost:
            return tableView.dequeueReusableCell(withIdentifier: Constants.postCellIdentifier, for: indexPath)
        case .recomendations:
            return tableView.dequeueReusableCell(withIdentifier: Constants.recomendatCellIdentifier, for: indexPath)
        }
    }

    func tableView(_: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let type = tableCellsTypes[indexPath.row]
        switch type {
        case .stories:
            return Constants.storiesCellHeight
        default:
            return UITableView.automaticDimension
        }
    }
}
