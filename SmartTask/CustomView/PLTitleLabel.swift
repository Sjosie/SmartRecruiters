//
//  PLTitleLabel.swift
//  SmartTask
//
//  Created by Evgeny Protopopov on 17.03.2022.
//

import UIKit

class PLTitleLabel: UILabel {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.setup()
    }
    
    func setup() {
        font = UIFont.systemFont(ofSize: 18)
    }
}
