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
        
        let textFieldLenghtTile = UITextField(frame: CGRect (x: 50, y: 100, width: 130, height: 52))
        textFieldLenghtTile.placeholder = "Длина плитки"
        textFieldLenghtTile.font = UIFont.systemFont(ofSize: 15)
        textFieldLenghtTile.borderStyle = UITextField.BorderStyle.roundedRect
        textFieldLenghtTile.keyboardType = UIKeyboardType.phonePad
        textFieldLenghtTile.returnKeyType = UIReturnKeyType.done
        textFieldLenghtTile.clearButtonMode = UITextField.ViewMode.whileEditing
        textFieldLenghtTile.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        self.view.addSubview(textFieldLenghtTile)
        
        let textFieldWidthTile = UITextField(frame: CGRect (x: 50, y: 200, width: 130, height: 52))
        textFieldWidthTile.placeholder = "Ширина плитки"
        textFieldWidthTile.font = UIFont.systemFont(ofSize: 15)
        textFieldWidthTile.borderStyle = UITextField.BorderStyle.roundedRect
        textFieldWidthTile.keyboardType = UIKeyboardType.phonePad
        textFieldWidthTile.returnKeyType = UIReturnKeyType.done
        textFieldWidthTile.clearButtonMode = UITextField.ViewMode.whileEditing
        textFieldWidthTile.contentVerticalAlignment = UITextField.ContentVerticalAlignment.center
        self.view.addSubview(textFieldWidthTile)
        
        let textFieldHeghtWall = UITextField(frame: CGRect (x: 250, y: 100, width: 130, height: 52))
        textFieldHeghtWall.placeholder = "Высота стены"
        textFieldHeghtWall.font = UIFont.systemFont(ofSize: 15)
        textFieldHeghtWall.borderStyle = UITextField.BorderStyle.roundedRect
        textFieldHeghtWall.keyboardType = UIKeyboardType.phonePad
        textFieldHeghtWall.returnKeyType = UIReturnKeyType.done
        textFieldHeghtWall.clearButtonMode = UITextField.ViewMode.whileEditing
        textFieldHeghtWall.contentVerticalAlignment = UITextField.ContentVerticalAlignment.center
        self.view.addSubview(textFieldHeghtWall)
        
        let textFieldWidthWall = UITextField(frame: CGRect(x: 250, y: 200, width: 130, height: 52))
        textFieldWidthWall.placeholder = "Ширина стены"
        textFieldWidthWall.font = UIFont.systemFont(ofSize: 15)
        textFieldWidthWall.borderStyle = UITextField.BorderStyle.roundedRect
        textFieldWidthWall.keyboardType = UIKeyboardType.phonePad
        textFieldWidthWall.returnKeyType = UIReturnKeyType.done
        textFieldWidthWall.clearButtonMode = UITextField.ViewMode.whileEditing
        textFieldWidthWall.contentVerticalAlignment = UITextField.ContentVerticalAlignment.center
        self.view.addSubview(textFieldWidthWall)
        
        let textFieldNumberOfTiles = UITextField(frame: CGRect(x: 150, y: 300, width: 170, height: 52))
        textFieldNumberOfTiles.placeholder = "Рассчеты по плитке"
        textFieldNumberOfTiles.font = UIFont.systemFont(ofSize: 15)
        textFieldNumberOfTiles.borderStyle = UITextField.BorderStyle.roundedRect
        textFieldNumberOfTiles.keyboardType = UIKeyboardType.phonePad
        textFieldNumberOfTiles.returnKeyType = UIReturnKeyType.done
        textFieldNumberOfTiles.clearButtonMode = UITextField.ViewMode.whileEditing
        textFieldNumberOfTiles.contentVerticalAlignment = UITextField.ContentVerticalAlignment.center
        self.view.addSubview(textFieldNumberOfTiles)
        
        let makeCalculation = UIButton.init(frame: CGRect(x: 150, y: 400, width: 170, height: 52))
        makeCalculation.setTitle("Сделать рассчеты", for: .normal)
        makeCalculation.layer.borderWidth = 1.0
        makeCalculation.layer.borderColor = UIColor.black.cgColor
        makeCalculation.addTarget(self, action: #selector(makeCalculation), for: .touchUpInside)
        self.view.addSubview(makeCalculation)
    }
    
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
}




