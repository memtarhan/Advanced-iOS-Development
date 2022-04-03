//
//  CoffeeTableViewCell.swift
//  CoffeeShop
//
//  Created by Mehmet Tarhan on 03/04/2022.
//

import UIKit

class CoffeeTableViewCell: UITableViewCell {
    @IBOutlet var coffeeImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
