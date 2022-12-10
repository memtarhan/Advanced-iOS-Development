//
//  AppsViewController.swift
//  AppStoreLab
//
//  Created by Mehmet Tarhan on 09/12/2022.
//

import UIKit

class AppsViewController: UIViewController {
    private let sections = Bundle.main.decode([Section].self, from: "appstore.json")

    @IBOutlet var collectionView: UICollectionView!

    var dataSource: UICollectionViewDiffableDataSource<Section, App>?

    override func viewDidLoad() {
        super.viewDidLoad()

//        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: UICollectionViewLayout())
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
//        collectionView.backgroundColor = .systemBackground
//        view.addSubview(collectionView)

//        collectionView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
//        collectionView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
//        collectionView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
//        collectionView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true

        collectionView.collectionViewLayout = createComponsitionalLayout()
        
        collectionView.register(FeaturedCell.self, forCellWithReuseIdentifier: FeaturedCell.resuseIdentifier)

        createDataSource()
        reloadData()
    }

    func configure<T: SelfConfiguringCell>(_ cellType: T.Type, withApp app: App, forIndexPath indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.resuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to dequeue cell")
        }

        cell.configure(withApp: app)
        return cell
    }

    func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, App>(collectionView: collectionView) { _, indexPath, app in
            switch self.sections[indexPath.section].type {
            default:
                return self.configure(FeaturedCell.self, withApp: app, forIndexPath: indexPath)
            }
        }
    }

    func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, App>()
        snapshot.appendSections(sections)

        for section in sections {
            snapshot.appendItems(section.items, toSection: section)
        }

        dataSource?.apply(snapshot)
    }

    func createComponsitionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
            let section = self.sections[sectionIndex]

            switch section.type {
            default:
                return self.createFeaturedSection(using: section)
            }
        }

        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 20
        layout.configuration = config

        return layout
    }

    func createFeaturedSection(using section: Section) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93), heightDimension: .estimated(350))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        return section
    }
}
