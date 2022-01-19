//
//  HomeCollectionView.swift
//  MVPmyProject
//
//  Created by Ivan Prokopyev on 03.01.2022.
//

import Foundation
import UIKit

class HomeCollectionView: UICollectionView {
    
    enum ViewOfTileCell: String {
        case standart
        case custom
    }
    
    private let typeOfTiles = [
        TileModelCell(type: .custom, backgroundColor: .blue),
        TileModelCell(type: .custom, backgroundColor: .blue),
        TileModelCell(type: .standart, backgroundColor: .darkGray)
    ]
    
    override init(
        frame: CGRect,
        collectionViewLayout layout: UICollectionViewLayout
    ) {
        super.init(frame: frame, collectionViewLayout: layout)
        delegate = self
        dataSource = self
        
        register(
            UICollectionViewCell.self,
            forCellWithReuseIdentifier: ViewOfTileCell.standart.rawValue
        )
        
        register(
            CustomCollectionCell.self,
            forCellWithReuseIdentifier: ViewOfTileCell.custom.rawValue
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HomeCollectionView: UICollectionViewDelegate {
    
}

extension HomeCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        CGSize(width: 60, height: 20)
    }
}

extension HomeCollectionView: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        typeOfTiles.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        
        let itemTile = typeOfTiles[indexPath.item]
        
        switch itemTile.type {
            
        case .standart:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ViewOfTileCell.standart.rawValue,
                for: indexPath
            )
            cell.backgroundColor = itemTile.backgroundColor
            return cell
            
        case .custom:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ViewOfTileCell.custom.rawValue,
                for: indexPath
            ) as? CustomCollectionCell
            cell?.area = 10
            //cell?.backgroundColor = item.backgroundColor
            cell?.configure(model: itemTile)
            return cell ?? UICollectionViewCell()
            
        }
        
        
    }
    
    
}
