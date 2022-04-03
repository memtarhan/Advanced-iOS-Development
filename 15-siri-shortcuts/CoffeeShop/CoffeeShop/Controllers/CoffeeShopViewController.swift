//
//  CoffeeShopViewController.swift
//  CoffeeShop
//
//  Created by Mehmet Tarhan on 03/04/2022.
//

import UIKit

class CoffeeShopViewController: UIViewController {
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension CoffeeShopViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Coffee") as! CoffeeTableViewCell

        cell.titleLabel.text = "Coffee #\(indexPath.row + 1)"

        let imageName = indexPath.row % 3
        let image = UIImage(named: "\(imageName)")
        cell.coffeeImageView.image = image

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: Implement selection
    }
}
