//
//  AppsViewController.swift
//  AppStoreLab
//
//  Created by Mehmet Tarhan on 09/12/2022.
//

import UIKit

class AppsViewController: UIViewController {
    private let sections = Bundle.main.decode([Section].self, from: "appstore.json")

    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewLayout())
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.backgroundColor = .systemBackground
        view.addSubview(collectionView)
    }
}
