//
//  CustomButton.swift
//  Animator_Starter
//
//  Created by Harrison Ferrone on 02.03.18.
//  Copyright © 2018 Paradigm Shift Development, LLC. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup() {
        self.round(cornerRadius: 25, borderWidth: 3, borderColor: .white)
    }

}
