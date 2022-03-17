//
//  UsersTableViewCell.swift
//  SmartTask
//
//  Created by Evgeny Protopopov on 17.03.2022.
//

import UIKit

class UsersTableViewCell: UITableViewCell {

    lazy private var userImage: PLImageView = {
        let imageView = PLImageView(frame: CGRect.zero)
        imageView.contentMode = .scaleAspectFill
        imageView.setCornerRadius()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy private var userName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(userImage)
        contentView.addSubview(userName)
        
        userImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        userImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        userImage.heightAnchor.constraint(equalToConstant: 60).isActive = true
        userImage.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        userName.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        userName.leftAnchor.constraint(equalTo: userImage.rightAnchor, constant: 30).isActive = true
    }
    
    func setupCell(dataModel: User?) {
        userName.text = dataModel?.name
        userImage.setImage(forURL: dataModel?.url)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
