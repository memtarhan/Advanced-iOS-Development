//
//  ViewController.swift
//  StackViews
//
//  Created by Mehmet Tarhan on 14/12/2022.
//

import UIKit

class ViewController: UIViewController {
    private let rows = [
        "Fill",
        "Fill Equally",
        "Equal Spacing",
        "Equal Centering",
        "CHCR Fill",
        "Scrollable",
    ]

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    private let cellIdentifier = "Cell"

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)

        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
        ])
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = rows[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = rows[indexPath.row]

        switch row {
        case "Fill":
            navigationController?.pushViewController(FillViewController(), animated: true)
        case "Fill Equally":
            navigationController?.pushViewController(FillEquallyViewController(), animated: true)
        case "Equal Spacing":
            navigationController?.pushViewController(EqualSpacingViewController(), animated: true)
        case "Equal Centering":
            navigationController?.pushViewController(EqualCenteringViewController(), animated: true)
        case "CHCR Fill":
            navigationController?.pushViewController(CHCRFillViewController(), animated: true)
        case "Scrollable":
            navigationController?.pushViewController(ScrollableViewController(), animated: true)
        default: break
        }
    }
}
