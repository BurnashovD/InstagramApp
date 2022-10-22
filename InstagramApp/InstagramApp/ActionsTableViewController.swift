//
//  ActionsTableViewController.swift
//  InstagramApp
//
//  Created by Daniil on 19.10.2022.
//

import UIKit

// Класс отвечает за вкладку "Действия"
final class ActionsTableViewController: UITableViewController {
    
    // MARK: - Visual components
    private let navBarTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.actionsText
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: Constants.navBarTitleFontSize, weight: .bold)
        return label
    }()
    
    private let actionsRefreshControl = UIRefreshControl()
    
    // MARK: - Private properties
    private let headersPeriods: [HeaderPeriods] = [.today, .thisWeek, .longTimeAgo]
    
     var todaysActions: [Action] = []
    private var thisWeekActions: [Action] = []
    private var longTimeAgoActions: [Action] = []
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavBar()
        createActions()
        refreshPageAction()
    }
    
    // MARK: - Private methods
    private func configNavBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: navBarTitleLabel)
    }
    
    private func createActions() {
        let firstAction = Action(profileImageName: Constants.avatarImageName,
                                 actionText: Constants.firstActionText,
                                 objectName: Constants.firstDogImageName,
                                 whenAction: Constants.threeHoursAgoAction, subButton: true)
        
        let thirdAction = Action(profileImageName: Constants.secondDogImageName,
                                 actionText: Constants.thirdActionText,
                                 objectName: Constants.sunImageName,
                                 whenAction: Constants.threeDaysAgoText, subButton: false)
        
        let fourAction = Action(profileImageName: Constants.firstDogImageName,
                                actionText: Constants.fourActionText,
                                objectName: Constants.secondDogImageName,
                                whenAction: Constants.fiveDaysAgoText, subButton: false)
        
        let fiveAction = Action(profileImageName: Constants.pizzaImageName,
                                actionText: Constants.fiveActionText,
                                objectName: Constants.avatarImageName,
                                whenAction: Constants.oneDayAgoText, subButton: true)
        
        let sixAction = Action(profileImageName: Constants.secondDogImageName,
                               actionText: Constants.sixActionText,
                               objectName: Constants.sunImageName,
                               whenAction: Constants.threeDaysAgoText, subButton: false)
        
        let sevenAction = Action(profileImageName: Constants.firstDogImageName,
                                 actionText: Constants.fourActionText,
                                 objectName: Constants.secondDogImageName,
                                 whenAction: Constants.fiveDaysAgoText, subButton: false)
        
        let eightAction = Action(profileImageName: Constants.pizzaImageName,
                                 actionText: Constants.fiveActionText,
                                 objectName: Constants.avatarImageName,
                                 whenAction: Constants.oneDayAgoText, subButton: false)
        
        let nineAction = Action(profileImageName: Constants.secondDogImageName,
                                actionText: Constants.firstActionText,
                                objectName: Constants.sunImageName,
                                whenAction: Constants.threeDaysAgoText, subButton: true)
        
        todaysActions.append(firstAction)
        thisWeekActions.append(thirdAction)
        thisWeekActions.append(fourAction)
        thisWeekActions.append(fiveAction)
        thisWeekActions.append(sixAction)
        longTimeAgoActions.append(sevenAction)
        longTimeAgoActions.append(eightAction)
        longTimeAgoActions.append(nineAction)
    }
    
    private func refreshPageAction() {
        actionsRefreshControl.tintColor = .white
        refreshControl = actionsRefreshControl
        actionsRefreshControl.addTarget(self, action: #selector(endRefreshAction), for: .valueChanged)
    }
    
    @objc private func endRefreshAction() {
        let secondAction = Action(profileImageName: Constants.pizzaImageName,
                                  actionText: Constants.sixActionText,
                                  objectName: Constants.firstDogImageName,
                                  whenAction: Constants.oneMinutieAgoText, subButton: false)
        todaysActions.append(secondAction)
        let indexPathNewRow = IndexPath(row: todaysActions.count - 1, section: 0)
        tableView.insertRows(at: [indexPathNewRow], with: .automatic)
        actionsRefreshControl.endRefreshing()
    }
}
    
    // MARK: - UITableViewDelegate, UITableViewDataSource
    extension ActionsTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let type = headersPeriods[section]
        switch type {
        case .today:
            return todaysActions.count
        case .thisWeek:
            return thisWeekActions.count
        case .longTimeAgo:
            return longTimeAgoActions.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.actionsCellIdentifier, for: indexPath) as? ActionsTableViewCell else { return UITableViewCell()}
  
        let type = headersPeriods[indexPath.section]
        
        switch type {
        case .today:
            let item = todaysActions[indexPath.row]
            cell.refresh(item)
        case .thisWeek:
            let item = thisWeekActions[indexPath.row]
            cell.refresh(item)
        case .longTimeAgo:
            let item = longTimeAgoActions[indexPath.row]
            cell.refresh(item)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.backgroundColor = .black
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: Constants.headerLabelFontSize, weight: .heavy)
        
        let type = headersPeriods[section]
        
        switch type {
        case .today:
            label.text = Constants.todayText
        case .thisWeek:
            label.text = Constants.thisWeekText
        case .longTimeAgo:
            label.text = Constants.longTimeAgoText
        }
        return label
    }
    
        override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
    }
}

/// Constants and HeaderPeriods enum
extension ActionsTableViewController {
    enum Constants {
        static let actionsText = "Действия"
        static let avatarImageName = "Avatar"
        static let firstDogImageName = "dog"
        static let secondDogImageName = "dogg"
        static let pizzaImageName = "pizza"
        static let sunImageName = "sun"
        static let todayText = " Сегодня"
        static let thisWeekText = " На этой неделе"
        static let longTimeAgoText = " Ну очень давно"
        static let actionsCellIdentifier = "actions"
        static let firstActionText = "lowbattery_0 подписался на вас"
        static let thirdActionText = "JackSock оставил комментарий: \"Отлично выглядишь!\""
        static let fourActionText = "Roma1 понравилась ваша фотография"
        static let fiveActionText = "Danil2 подписался на вас"
        static let sixActionText = "Qwerty123 нравится ваше фото"
        static let threeHoursAgoAction = "3ч"
        static let oneMinutieAgoText = "1мин"
        static let threeDaysAgoText = "3д"
        static let fiveDaysAgoText = "5д"
        static let oneDayAgoText = "1д"
        static let navBarTitleFontSize: CGFloat = 30
        static let headerLabelFontSize: CGFloat = 16
    }
    
    enum HeaderPeriods {
        case today
        case thisWeek
        case longTimeAgo
    }
}
