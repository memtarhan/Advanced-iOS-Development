//
//  ViewController.swift
//  ScrollableViewController
//
//  Created by Mehmet Tarhan on 08/12/2022.
//

import UIKit

class ViewController: ScrollableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let view1 = UIView()
        view1.backgroundColor = .systemBrown
        view1.translatesAutoresizingMaskIntoConstraints = false

        addSubview(view1)

        view1.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        let view2 = UIView()
        view2.backgroundColor = .systemCyan
        view2.translatesAutoresizingMaskIntoConstraints = false

        addSubview(view2)

        view2.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        let view3 = UIView()
        view3.backgroundColor = .systemRed
        view3.translatesAutoresizingMaskIntoConstraints = false

        addSubview(view3)

        view3.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
    }
}
