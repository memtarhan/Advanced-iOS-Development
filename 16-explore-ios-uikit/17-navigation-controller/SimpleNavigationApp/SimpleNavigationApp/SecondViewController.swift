//
//  SecondViewController.swift
//  SimpleNavigationApp
//
//  Created by Mehmet Tarhan on 08/04/2022.
//

import UIKit

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Second"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let customButton = UIBarButtonItem()
        customButton.title = "New back text"
        navigationItem.backBarButtonItem = customButton
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        performSegue(withIdentifier: "secondLink", sender: self)
    }
}
