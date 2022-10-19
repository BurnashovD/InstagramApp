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
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navigationTitleLabel: UILabel!
    
    // MARK: - Private properties
    private let refresh = UIRefreshControl()
    
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
        tableView.refreshControl = refresh
        refresh.tintColor = .white
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(endRefreshAtion), userInfo: nil, repeats: true)
    }
    
    @objc private func endRefreshAtion() {
        refresh.endRefreshing()
    }
}

/// Constants
extension MainScreenViewController {
    enum Constants {
        static let storiesIdentifyCell = "stories"
        static let postIdentifyCell = "post"
        static let recomendationIdentifyCell = "recomendations"
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
            return tableView.dequeueReusableCell(withIdentifier: Constants.storiesIdentifyCell, for: indexPath)
        case 1, 3, 4:
            return tableView.dequeueReusableCell(withIdentifier: Constants.postIdentifyCell, for: indexPath)
        case 2:
            return tableView.dequeueReusableCell(withIdentifier: Constants.recomendationIdentifyCell, for: indexPath)
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 110
        default:
            return UITableView.automaticDimension
        }
    }
}


