//
//  ViewController.swift
//  GitHubUsers
//
//  Created by Rita on 29.01.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private var tableView = UITableView()
    private var users = [User]()
    private let dataFetcherService = DataFetcherService()
    private let myRefreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        setupScreen()
        myRefreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        tableView.refreshControl = myRefreshControl
    }
    
    @objc private func refresh(sender: UIRefreshControl) {
        fetchData()
        sender.endRefreshing()
    }
    
    func fetchData() {
        dataFetcherService.fetchData { (answers) in
            guard let answer = answers else { return }
            self.users = answer
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setupScreen() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifierCell)
        title = "GitHub Users"
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifierCell) as! TableViewCell
        let user = users[indexPath.row]
        cell.userid.text = "\(user.id)"
        cell.userlogin.text = user.login
        cell.getUserImage(user: user)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        let userDetailsViewController = UserDetailsViewController(currentUser: user)
        navigationController?.pushViewController(userDetailsViewController, animated: true)
    }
}
