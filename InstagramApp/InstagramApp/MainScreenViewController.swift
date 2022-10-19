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
    @IBOutlet weak private var tableView: UITableView!
    @IBOutlet weak private var navigationTitleLabel: UILabel!
    
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
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(endRefreshAtion), userInfo: nil, repeats: true)
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return tableView.dequeueReusableCell(withIdentifier: Constants.storiesCellIdentifier, for: indexPath)
        case 1, 3, 4:
            return tableView.dequeueReusableCell(withIdentifier: Constants.postCellIdentifier, for: indexPath)
        case 2:
            return tableView.dequeueReusableCell(withIdentifier: Constants.recomendatCellIdentifier, for: indexPath)
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return Constants.storiesCellHeight
        default:
            return UITableView.automaticDimension
        }
    }
}


