//
//  HomeCollectionView.swift
//  MVPmyProject
//
//  Created by Ivan Prokopyev on 03.01.2022.
//

import Foundation
import UIKit

class HomeCollectionView: UICollectionView {
    
    enum Cell: String {
        case standart
    }
    
    override init(
        frame: CGRect,
        collectionViewLayout layout: UICollectionViewLayout
    ) {
        super.init(frame: frame, collectionViewLayout: layout)
        delegate = self
        dataSource = self
        
        register(
            UICollectionViewCell.self,
            forCellWithReuseIdentifier: Cell.standart.rawValue
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
        200
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Cell.standart.rawValue,
            for: indexPath
        )
        cell.backgroundColor = .blue
        return cell
    }
    
    
}
