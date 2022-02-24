//
//  LoginViewController.swift
//  Connect
//
//  Created by Mehmet Tarhan on 24/02/2022.
//  Copyright © 2022 Mehmet Tarhan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var continueButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapContinue(_ sender: Any) {
        if let username = usernameTextField.text,
           username != "" {
            UserDefaults.standard.set(username, forKey: "username")
            performSegue(withIdentifier: "toChat", sender: nil)
        }
    }

    @IBAction func didEdit(_ sender: UITextField) {
        continueButton.isEnabled = sender.text != nil || sender.text != ""
    }
}
