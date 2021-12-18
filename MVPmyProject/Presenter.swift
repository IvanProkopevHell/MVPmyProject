//
//  Presenter.swift
//  MVPmyProject
//
//  Created by Ivan Prokopyev on 18.12.2021.
//

import Foundation
    
@objc func makeCalculation() {
    
    guard let textFieldLenghtTile = Float16(textFieldLenghtTile.text!) else {return}
        guard let textFieldWidthTile = Float16(textFieldWidthTile.text!) else {return}
            
            tile.lenght = textFieldLenghtTile
            tile.widht = textFieldWidthTile
            
            let squareTile = tile.lenght * tile.widht
            
            guard let textFieldHeightWall = Float16(textFieldHeghtWall.text!) else {return}
                guard let textFieldWidthWall = Float16(textFieldWidthWall.text!) else {return}
                    
                    wall.height = textFieldHeightWall
                    wall.widht = textFieldWidthWall
                    
                    let squareWall = wall.height * wall.widht
                    
                    textFieldNumberOfTiles.text = "\(squareWall/squareTile)"
                    }
