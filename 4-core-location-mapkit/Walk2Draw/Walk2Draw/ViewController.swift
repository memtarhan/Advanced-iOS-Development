//
//  ViewController.swift
//  Walk2Draw
//
//  Created by Mehmet Tarhan on 14/04/2022.
//

import UIKit

class ViewController: UIViewController {
    var locationProvider: LocationProvider?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGreen

        locationProvider = LocationProvider()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        locationProvider?.start()
    }
}
