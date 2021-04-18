//
//  AnnotationDetailViewController.swift
//  PizzaHistoryMap
//
//  Created by Steven Lipton on 7/20/17.
//  Copyright © 2017 Steven Lipton. All rights reserved.
//

import UIKit

class AnnotationDetailViewController: UIViewController {
    var annotation: PizzaAnnotation!
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var pizzaPhoto: UIImageView!
    @IBOutlet var historyText: UITextView!

    @IBAction func done(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = annotation.title
        pizzaPhoto.image = annotation.photo
        historyText.text = annotation.history
        // Do any additional setup after loading the view.
    }
}
