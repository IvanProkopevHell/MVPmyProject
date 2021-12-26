//
//  HomeViewController.swift
//  MVPmyProject
//
//  Created by Ivan Prokopyev on 21.12.2021.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    var presenter: HomePresenterInput!
    var configurator: HomeConfigurable!
    
    private lazy var makeCalculation: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(onButtonClick), for: .touchUpInside)
        button.setTitle("Start", for: .normal)
        button.layer.borderColor = UIColor.red.cgColor
        button.layer.borderWidth = 1.0
        return button
    }()
    
    lazy var lengthTileField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "Длина плитки"
        field.font = UIFont.systemFont(ofSize: 15)
        field.borderStyle = UITextField.BorderStyle.roundedRect
        field.keyboardType = UIKeyboardType.phonePad
        field.returnKeyType = UIReturnKeyType.done
        field.clearButtonMode = UITextField.ViewMode.whileEditing
        field.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return field
    }()
    
    lazy var widthTileField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "Ширина плитки"
        field.font = UIFont.systemFont(ofSize: 15)
        field.borderStyle = UITextField.BorderStyle.roundedRect
        field.keyboardType = UIKeyboardType.phonePad
        field.returnKeyType = UIReturnKeyType.done
        field.clearButtonMode = UITextField.ViewMode.whileEditing
        field.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return field
    }()
    
    lazy var heightWallField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "Высота стены"
        field.font = UIFont.systemFont(ofSize: 15)
        field.borderStyle = UITextField.BorderStyle.roundedRect
        field.keyboardType = UIKeyboardType.phonePad
        field.returnKeyType = UIReturnKeyType.done
        field.clearButtonMode = UITextField.ViewMode.whileEditing
        field.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return field
    }()
    
    lazy var widthWallField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "Ширина стены"
        field.font = UIFont.systemFont(ofSize: 15)
        field.borderStyle = UITextField.BorderStyle.roundedRect
        field.keyboardType = UIKeyboardType.phonePad
        field.returnKeyType = UIReturnKeyType.done
        field.clearButtonMode = UITextField.ViewMode.whileEditing
        field.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return field
    }()
    
    lazy var numberOfTilesField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "Количество плит(ок)"
        field.font = UIFont.systemFont(ofSize: 15)
        field.borderStyle = UITextField.BorderStyle.roundedRect
        field.keyboardType = UIKeyboardType.phonePad
        field.returnKeyType = UIReturnKeyType.done
        field.clearButtonMode = UITextField.ViewMode.whileEditing
        field.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return field
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configurator = HomeConfigurator()
        configurator.configure(viewController: self)
        presenter.viewDidLoad()
        
        setupLayout()
        }
    
    private func setupLayout() {
        [makeCalculation,
        lengthTileField,
        widthTileField].forEach(view.addSubview)
        view.addSubview(heightWallField)
        view.addSubview(widthWallField)
        view.addSubview(numberOfTilesField)
        
        NSLayoutConstraint.activate([
            lengthTileField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            lengthTileField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            lengthTileField.heightAnchor.constraint(equalToConstant: 25),
            lengthTileField.widthAnchor.constraint(equalToConstant: 150),
        
            widthTileField.topAnchor.constraint(equalTo: lengthTileField.bottomAnchor, constant: 20),
            widthTileField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            widthTileField.heightAnchor.constraint(equalToConstant: 25),
            widthTileField.widthAnchor.constraint(equalToConstant: 150),
        
            heightWallField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            heightWallField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            heightWallField.heightAnchor.constraint(equalToConstant: 25),
            heightWallField.widthAnchor.constraint(equalToConstant: 150),
        
            widthWallField.topAnchor.constraint(equalTo: heightWallField.bottomAnchor, constant: 20),
            widthWallField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            widthWallField.heightAnchor.constraint(equalToConstant: 25),
            widthWallField.widthAnchor.constraint(equalToConstant: 150),
      
            makeCalculation.topAnchor.constraint(equalTo: numberOfTilesField.bottomAnchor, constant: 20),
            makeCalculation.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            makeCalculation.heightAnchor.constraint(equalToConstant: 40),
            makeCalculation.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        numberOfTilesField.topAnchor.constraint(equalTo: widthWallField.bottomAnchor, constant: 20).isActive = true
        numberOfTilesField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        numberOfTilesField.heightAnchor.constraint(equalToConstant: 25).isActive = true
        numberOfTilesField.widthAnchor.constraint(equalToConstant: 200).isActive = true

    }
    
    
    @objc
    private func onButtonClick() {
        guard let lengthOfTile = lengthTileField.text, let widthOfTile = widthTileField.text, let heightOfWall = heightWallField.text, let widthOfWall = widthWallField.text else {
            fatalError("Error")
        }
        
        guard let lengthTile = Float16(lengthTileField.text!), let widthTile = Float16(widthTileField.text!), let heightWall = Float16(heightWallField.text!), let widthWall = Float16(widthWallField.text!)
        else {return}
        
        let squareOfTile = lengthTile * widthTile
        
        let squareOfWall = heightWall * widthWall
        
        numberOfTilesField.text = "\(squareOfWall/squareOfTile)"
    
        presenter.onButtonClick(lengthOfTile: lengthOfTile, widthOfTile: widthOfTile, heightOfWall: heightOfWall, widthOfWall: widthOfWall)
    }
    
}
extension HomeViewController: HomePresenterOutput {
    
}
