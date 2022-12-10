//
//  SelfConfiguringCell.swift
//  AppStoreLab
//
//  Created by Mehmet Tarhan on 10/12/2022.
//

import Foundation

protocol SelfConfiguringCell {
    static var resuseIdentifier: String { get }
    func configure(withApp app: App)
}
