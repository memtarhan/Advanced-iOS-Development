//
//  ViewController.swift
//  MovieLand
//
//  Created by Mehmet Tarhan on 4.04.2021.
//

import UIKit

class LibraryViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    @IBOutlet var dataService: MovieLibraryDataService!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = dataService
        tableView.delegate = dataService
    }
}
