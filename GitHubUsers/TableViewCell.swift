//
//  TableViewCell.swift
//  GitHubUsers
//
//  Created by Rita on 29.01.2022.
//

import UIKit
import Kingfisher

class TableViewCell: UITableViewCell {

    static let identifierCell = String(describing: ViewController.self)
    
    let userlogin = UILabel()
    let userid = UILabel()
    var avatarImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: TableViewCell.identifierCell)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
//        let screenWidth = UIScreen.main.bounds.width
        
        contentView.addSubview(userlogin)
        userlogin.textAlignment = .center
        userlogin.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().inset(150)
            make.centerY.equalToSuperview()
        }
        
        contentView.addSubview(userid)
        userid.textAlignment = .center
        userid.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().inset(75)
            make.centerY.equalToSuperview()
        }
        
        contentView.addSubview(avatarImage)
        avatarImage.contentMode = .scaleAspectFit
        avatarImage.snp.makeConstraints { (make) in
            make.bottom.top.equalToSuperview()
            make.width.equalTo(100)
            make.leading.equalToSuperview()
        }
    }
    
    func getUserImage(user: User) {
        let url = URL(string: user.avatar_url)
        avatarImage.kf.setImage(with: url)
    }
}
