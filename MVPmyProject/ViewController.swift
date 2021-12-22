//
//  ViewController.swift
//  MVPmyProject
//
//  Created by Ivan Prokopyev on 14.12.2021.
//

import UIKit



final class ViewController: UIViewController {
    var tile = Tile()
    var wall = Wall()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let lenghtTile = UITextField(frame: CGRect (x: 50, y: 100, width: 130, height: 52))
        lenghtTile.placeholder = "Длина плитки"
        lenghtTile.font = UIFont.systemFont(ofSize: 15)
        lenghtTile.borderStyle = UITextField.BorderStyle.roundedRect
        lenghtTile.keyboardType = UIKeyboardType.phonePad
        lenghtTile.returnKeyType = UIReturnKeyType.done
        lenghtTile.clearButtonMode = UITextField.ViewMode.whileEditing
        lenghtTile.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        self.view.addSubview(lenghtTile)
        
        let widthTile = UITextField(frame: CGRect (x: 50, y: 200, width: 130, height: 52))
        widthTile.placeholder = "Ширина плитки"
        widthTile.font = UIFont.systemFont(ofSize: 15)
        widthTile.borderStyle = UITextField.BorderStyle.roundedRect
        widthTile.keyboardType = UIKeyboardType.phonePad
        widthTile.returnKeyType = UIReturnKeyType.done
        widthTile.clearButtonMode = UITextField.ViewMode.whileEditing
        widthTile.contentVerticalAlignment = UITextField.ContentVerticalAlignment.center
        self.view.addSubview(widthTile)
        
        let heightWall = UITextField(frame: CGRect (x: 250, y: 100, width: 130, height: 52))
        heightWall.placeholder = "Высота стены"
        heightWall.font = UIFont.systemFont(ofSize: 15)
        heightWall.borderStyle = UITextField.BorderStyle.roundedRect
        heightWall.keyboardType = UIKeyboardType.phonePad
        heightWall.returnKeyType = UIReturnKeyType.done
        heightWall.clearButtonMode = UITextField.ViewMode.whileEditing
        heightWall.contentVerticalAlignment = UITextField.ContentVerticalAlignment.center
        self.view.addSubview(heightWall)
        
        let widthWall = UITextField(frame: CGRect(x: 250, y: 200, width: 130, height: 52))
        widthWall.placeholder = "Ширина стены"
        widthWall.font = UIFont.systemFont(ofSize: 15)
        widthWall.borderStyle = UITextField.BorderStyle.roundedRect
        widthWall.keyboardType = UIKeyboardType.phonePad
        widthWall.returnKeyType = UIReturnKeyType.done
        widthWall.clearButtonMode = UITextField.ViewMode.whileEditing
        widthWall.contentVerticalAlignment = UITextField.ContentVerticalAlignment.center
        self.view.addSubview(widthWall)
        
        let numberOfTiles = UITextField(frame: CGRect(x: 150, y: 300, width: 170, height: 52))
        numberOfTiles.placeholder = "Рассчеты по плитке"
        numberOfTiles.font = UIFont.systemFont(ofSize: 15)
        numberOfTiles.borderStyle = UITextField.BorderStyle.roundedRect
        numberOfTiles.keyboardType = UIKeyboardType.phonePad
        numberOfTiles.returnKeyType = UIReturnKeyType.done
        numberOfTiles.clearButtonMode = UITextField.ViewMode.whileEditing
        numberOfTiles.contentVerticalAlignment = UITextField.ContentVerticalAlignment.center
        self.view.addSubview(numberOfTiles)
        
        let makeCalculation = UIButton.init(frame: CGRect(x: 150, y: 400, width: 170, height: 52))
        makeCalculation.setTitle("Сделать рассчеты", for: .normal)
        makeCalculation.layer.borderWidth = 1.0
        makeCalculation.layer.borderColor = UIColor.black.cgColor
        self.view.addSubview(makeCalculation)
    }
  
}




