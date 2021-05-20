//
//  UserInfoHeader.swift
//  Me and Mine
//
//  Created by Amaya Finklea on 3/26/20.
//  Copyright © 2020 Logan. All rights reserved.
//

import UIKit

class UserInfoHeader: UITableView {

   let profileImageView: UIImageView = {
         let iv = UIImageView()
         iv.contentMode = .scaleAspectFill
         iv.clipsToBounds = true
         iv.translatesAutoresizingMaskIntoConstraints = false
         iv.image = UIImage(named: "")
         return iv
     }()
     
     let usernameLabel: UILabel = {
         let label = UILabel()
         label.text = "Username"
         label.font = UIFont.systemFont(ofSize: 16)
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()
     
     let emailLabel: UILabel = {
         let label = UILabel()
         label.text = "username email"
         label.font = UIFont.systemFont(ofSize: 14)
         label.textColor = .lightGray
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()
     
     // MARK: - Init
     
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
         
         let profileImageDimension: CGFloat = 60
         
         addSubview(profileImageView)
         profileImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
         profileImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
         profileImageView.widthAnchor.constraint(equalToConstant: profileImageDimension).isActive = true
         profileImageView.heightAnchor.constraint(equalToConstant: profileImageDimension).isActive = true
         profileImageView.layer.cornerRadius = profileImageDimension / 2
         
         addSubview(usernameLabel)
         usernameLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor, constant: -10).isActive = true
         usernameLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 12).isActive = true
         
         addSubview(emailLabel)
         emailLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor, constant: 10).isActive = true
         emailLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 12).isActive = true
     }
     
     required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
     

}
