//
//  MainViewController.swift
//  CollectionView-Template
//
//  Created by Mohammad Alhasson on 28.05.21.
//

import UIKit

class MainViewController: UICollectionViewController {

    let adsCellID = "cellId"
    let catCellID = "catCellID"
    let randomCellID = "randomCell"
    let productCellID = "productCellID"
    
    let headerID = "headerID"
    static let categoryHeaderID = "categoryHeaderID"
    
    init() {
        super.init(collectionViewLayout: MainViewController.createLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "CollectionView Template"
        collectionView.backgroundColor = .systemBackground
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: adsCellID)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: catCellID)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: randomCellID)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: productCellID)
        collectionView.register(UICollectionViewCell.self, forSupplementaryViewOfKind: MainViewController.categoryHeaderID, withReuseIdentifier: headerID)
    }
    
    //MARK: - CollectionView Layout
    static func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            if sectionNumber == 0 {
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 2
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(200)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .paging
                
                return section
            } else if sectionNumber == 1 {
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.25), heightDimension: .absolute(100)))
                item.contentInsets.trailing = 16
                item.contentInsets.bottom = 16
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(500)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.leading = 16
                section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40)), elementKind: categoryHeaderID, alignment: .topLeading)
                ]
                return section
            } else if sectionNumber == 2 {
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.top = 16
                item.contentInsets.leading = 16
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.75), heightDimension: .absolute(100)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                
                return section
            }  else {
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(200)))
                item.contentInsets.top = 16
                item.contentInsets.trailing = 16
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1000)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.leading = 16
                return section
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath)
        return header
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        4
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1:
            return 12
        case 2:
            return 10
        case 3:
            return 10
        default:
            return 1
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let adsCell = collectionView.dequeueReusableCell(withReuseIdentifier: adsCellID, for: indexPath) as UICollectionViewCell
            adsCell.backgroundColor = .systemGreen
            return adsCell
        case 1:
            let catCell = collectionView.dequeueReusableCell(withReuseIdentifier: catCellID, for: indexPath) as UICollectionViewCell
            catCell.backgroundColor = .systemYellow
            catCell.layer.cornerRadius = 10
            return catCell
        case 2:
            let radnomCell = collectionView.dequeueReusableCell(withReuseIdentifier: randomCellID, for: indexPath) as UICollectionViewCell
            radnomCell.backgroundColor = .systemTeal
            radnomCell.layer.cornerRadius = 10
            return radnomCell
        default:
            let productCell = collectionView.dequeueReusableCell(withReuseIdentifier: productCellID, for: indexPath) as UICollectionViewCell
            productCell.backgroundColor = .systemRed
            productCell.layer.cornerRadius = 10
            return productCell
        }
    }
}

