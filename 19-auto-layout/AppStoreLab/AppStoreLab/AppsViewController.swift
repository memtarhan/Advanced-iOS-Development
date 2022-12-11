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

        collectionView.collectionViewLayout = createComponsitionalLayout()

        collectionView.register(FeaturedCell.self, forCellWithReuseIdentifier: FeaturedCell.resuseIdentifier)
        collectionView.register(MediumCell.self, forCellWithReuseIdentifier: MediumCell.resuseIdentifier)
        collectionView.register(SmallCell.self, forCellWithReuseIdentifier: SmallCell.resuseIdentifier)

        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.reuseIdentifier)

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
            case "mediumTable":
                return self.configure(MediumCell.self, withApp: app, forIndexPath: indexPath)
            case "smallTable":
                return self.configure(SmallCell.self, withApp: app, forIndexPath: indexPath)
            default:
                return self.configure(FeaturedCell.self, withApp: app, forIndexPath: indexPath)
            }
        }

        dataSource?.supplementaryViewProvider = { [weak self] collectionView, kind, indexPath in
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.reuseIdentifier, for: indexPath) as? SectionHeader else {
                return nil
            }

            guard let firstApp = self?.dataSource?.itemIdentifier(for: indexPath) else { return nil }
            guard let section = self?.dataSource?.snapshot().sectionIdentifier(containingItem: firstApp) else { return nil }

            if section.title.isEmpty { return nil }

            header.titleLabel.text = section.title
            header.subtitleLabel.text = section.subtitle

            return header
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
            case "mediumTable":
                return self.createMediumSection(using: section)
            case "smallTable":
                return self.createSmallSection(using: section)
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

    func createMediumSection(using section: Section) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.33))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93), heightDimension: .fractionalWidth(0.55))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered

        /// - Header
        section.boundarySupplementaryItems = [createSectionHeader()]

        return section
    }

    func createSmallSection(using section: Section) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.2))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93), heightDimension: .estimated(200))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)

        /// - Header
        section.boundarySupplementaryItems = [createSectionHeader()]

        return section
    }

    func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93), heightDimension: .estimated(80))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)

        return header
    }
}
