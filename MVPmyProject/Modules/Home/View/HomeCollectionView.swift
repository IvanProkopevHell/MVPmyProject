//
//  HomeCollectionView.swift
//  MVPmyProject
//
//  Created by Ivan Prokopyev on 03.01.2022.
//

import Foundation
import UIKit

class HomeCollectionView: UICollectionViewCell {
 
    static let nib = UINib(nibName: String(describing: HomeCollectionView.self), bundle: nil)
    
    override func awakeFromNib() {
           super.awakeFromNib()
           backgroundColor = .white
           clipsToBounds = true
           layer.cornerRadius = 4
           ibLabel.font = UIFont.systemFont(ofSize: 18)
       }
    
    
}
