//
//  PLImageView.swift
//  SmartTask
//
//  Created by Evgeny Protopopov on 17.03.2022.
//

import UIKit
import SDWebImage

class PLImageView: UIImageView {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setCornerRadius(cornerRadius: CGFloat = 16) {
        contentMode = .scaleAspectFit
        layer.cornerRadius = cornerRadius
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 1
        layer.masksToBounds = true
    }
    
    func setImage(forURL path: String?){
        if let strPath = path, let url = URL(string: strPath) {
            self.sd_setImage(with: url, placeholderImage: UIImage(named: "ic_profile_placeholder"))
        }
    }
}

