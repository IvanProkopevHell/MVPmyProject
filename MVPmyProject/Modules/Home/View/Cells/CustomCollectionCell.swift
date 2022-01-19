//
//  CustomCollectionCell.swift
//  MVPmyProject
//
//  Created by Ivan Prokopyev on 17.01.2022.
//

import UIKit

class CustomCollectionCell: UICollectionViewCell {
    private var imageView = UIView(
        frame: CGRect(x: 0, y: 0, width: 20, height: 20)
    )
    var area = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.layer.cornerRadius = imageView.frame.height/2
        imageView.backgroundColor = .yellow
        contentView.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: TileModelCell) {
        backgroundColor = model.backgroundColor
    }
    
}
