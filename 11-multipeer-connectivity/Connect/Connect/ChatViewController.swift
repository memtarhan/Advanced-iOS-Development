//
//  ChatViewController.swift
//  Connect
//
//  Created by Mehmet Tarhan on 24/02/2022.
//  Copyright © 2022 Mehmet Tarhan. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {
    
    @IBOutlet weak var hostButton: UIButton!
    @IBOutlet weak var guestButton: UIButton!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var chatTextView: UITextView!
    @IBOutlet weak var messageTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func didTapHost(_ sender: Any) {
    }

    @IBAction func didTapGuest(_ sender: Any) {
    }

    @IBAction func didTapSend(_ sender: Any) {
    }
}
