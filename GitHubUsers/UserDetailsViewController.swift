//
//  UserDetailsViewController.swift
//  GitHubUsers
//
//  Created by Rita on 30.01.2022.
//

import UIKit
import SnapKit
import Kingfisher

class UserDetailsViewController: UIViewController {
    
    private var avatarImage = UIImageView()
    private let userName = UILabel()
    private let userEmail = UILabel()
    private let userOrganization = UILabel()
    private let userFollowingCount = UILabel()
    private let userFollowersCount = UILabel()
    //    private let networkManager = NetworkManager()
    private let currentUser: User
    private var userDetail: UserDetail?
    private let dataFetcherService = DataFetcherService()
    
    init(currentUser: User) {
        self.currentUser = currentUser
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        getUser()
        setup()
    }
    
    
    
    func getUser() {
        dataFetcherService.fetchUserDetails(user: currentUser) { (answer) in
            self.userDetail = answer
            DispatchQueue.main.async {
                self.setupInfo()
            }
        }
    }
    
    func setup() {
        
        view.addSubview(avatarImage)
        avatarImage.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().inset(85)
            
        }
        
        let stackView = UIStackView(arrangedSubviews: [userName, userEmail, userOrganization, userFollowingCount, userFollowersCount, UIView()])
        stackView.axis = .vertical
        stackView.spacing = 8
        view.addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview().inset(8)
            make.top.equalTo(avatarImage.snp.bottom).inset(-8)
        }
    }
    
    func setupInfo() {
        userName.text = "Name: \(userDetail?.name ?? "")"
        userEmail.text = "Email: \(userDetail?.email ?? "")"
        userOrganization.text = "Organization: \(userDetail?.company ?? "")"
        userOrganization.numberOfLines = 0
        userFollowingCount.text = "Following: \(userDetail?.following ?? 0)"
        userFollowersCount.text = "Followers: \(userDetail?.followers ?? 0)"
        let url = URL(string: userDetail?.avatar_url ?? "")
        avatarImage.kf.setImage(with: url)
        avatarImage.contentMode = .scaleAspectFill
        avatarImage.clipsToBounds = true
        
    }
}
