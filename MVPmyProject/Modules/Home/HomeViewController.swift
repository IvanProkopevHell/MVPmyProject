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
    
    private lazy var calculationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(
            self,
            action: #selector(onCalculateSquare),
            for: .touchUpInside
        )
        button.setTitle("Start", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 15
        return button
    }()
    
    private lazy var lengthTileField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.font = UIFont.systemFont(ofSize: 15)
        field.borderStyle = UITextField.BorderStyle.roundedRect
        field.keyboardType = UIKeyboardType.phonePad
        field.returnKeyType = UIReturnKeyType.done
        field.clearButtonMode = UITextField.ViewMode.whileEditing
        field.contentVerticalAlignment = .center
        field.layer.cornerRadius = 20
        return field
    }()
    
    private lazy var lengthTileLabeL: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Длина плитки (см)"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    private lazy var widthTileField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.font = UIFont.systemFont(ofSize: 15)
        field.borderStyle = UITextField.BorderStyle.roundedRect
        field.keyboardType = UIKeyboardType.phonePad
        field.returnKeyType = UIReturnKeyType.done
        field.clearButtonMode = UITextField.ViewMode.whileEditing
        field.contentVerticalAlignment = .center
        field.layer.cornerRadius = 20
        return field
    }()
    
    private lazy var widthTileLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Ширина плитки (см)"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    private lazy var heightWallField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.font = UIFont.systemFont(ofSize: 15)
        field.borderStyle = UITextField.BorderStyle.roundedRect
        field.keyboardType = UIKeyboardType.phonePad
        field.returnKeyType = UIReturnKeyType.done
        field.clearButtonMode = UITextField.ViewMode.whileEditing
        field.contentVerticalAlignment = .center
        field.layer.cornerRadius = 20
        return field
    }()
    
    private lazy var heightWallLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Высота стены (см)"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    private lazy var widthWallField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.font = UIFont.systemFont(ofSize: 15)
        field.borderStyle = UITextField.BorderStyle.roundedRect
        field.keyboardType = UIKeyboardType.phonePad
        field.returnKeyType = UIReturnKeyType.done
        field.clearButtonMode = UITextField.ViewMode.whileEditing
        field.contentVerticalAlignment = .center
        field.layer.cornerRadius = 20
        return field
    }()
    
    private lazy var widthWallLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Ширина стены (см)"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    private lazy var numberOfTilesField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "Количество плит(ок)"
        field.font = UIFont.systemFont(ofSize: 15)
        field.borderStyle = UITextField.BorderStyle.roundedRect
        field.keyboardType = UIKeyboardType.phonePad
        field.returnKeyType = UIReturnKeyType.done
        field.clearButtonMode = UITextField.ViewMode.whileEditing
        field.contentVerticalAlignment = .center
        field.layer.cornerRadius = 20
        return field
    }()
    
    private lazy var nameVersionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Version 1.0"
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    override func loadView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 60, height: 20)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.scrollDirection = .horizontal
        
        self.view = HomeCollectionView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: UIScreen.main.bounds.width,
                height: UIScreen.main.bounds.height
            ),
            collectionViewLayout: layout)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configurator = HomeConfigurator()
        configurator.configure(viewController: self)
        presenter.viewDidLoad()
        
        //   setupLayout()
    }
    
    private func setupLayout() {
        [calculationButton,
         lengthTileField,
         widthTileField
        ].forEach(view.addSubview)
        view.addSubview(heightWallField)
        view.addSubview(widthWallField)
        view.addSubview(numberOfTilesField)
        view.addSubview(nameVersionLabel)
        view.addSubview(lengthTileLabeL)
        view.addSubview(widthTileLabel)
        view.addSubview(heightWallLabel)
        view.addSubview(widthWallLabel)
        
        NSLayoutConstraint.activate([
            lengthTileField.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 20
            ),
            lengthTileField.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: 5
            ),
            lengthTileField.heightAnchor.constraint(equalToConstant: 25),
            lengthTileField.widthAnchor.constraint(equalToConstant: 165),
            
            
            lengthTileLabeL.topAnchor.constraint(
                equalTo: lengthTileField.bottomAnchor,
                constant: 1
            ),
            lengthTileLabeL.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: 5
            ),
            lengthTileLabeL.heightAnchor.constraint(equalToConstant: 10),
            lengthTileLabeL.widthAnchor.constraint(equalToConstant: 165),
            
            
            widthTileField.topAnchor.constraint(
                equalTo: lengthTileField.bottomAnchor,
                constant: 20
            ),
            widthTileField.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: 5
            ),
            widthTileField.heightAnchor.constraint(equalToConstant: 25),
            widthTileField.widthAnchor.constraint(equalToConstant: 165),
            
            
            widthTileLabel.topAnchor.constraint(
                equalTo: widthTileField.bottomAnchor,
                constant: 1
            ),
            widthTileLabel.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: 5
            ),
            widthTileLabel.heightAnchor.constraint(equalToConstant: 10),
            widthTileLabel.widthAnchor.constraint(equalToConstant: 165),
            
            
            heightWallField.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 20
            ),
            heightWallField.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -5
            ),
            heightWallField.heightAnchor.constraint(equalToConstant: 25),
            heightWallField.widthAnchor.constraint(equalToConstant: 165),
            
            
            heightWallLabel.topAnchor.constraint(
                equalTo: heightWallField.bottomAnchor,
                constant: 1
            ),
            heightWallLabel.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -5
            ),
            heightWallLabel.heightAnchor.constraint(equalToConstant: 10),
            heightWallLabel.widthAnchor.constraint(equalToConstant: 165),
            
            
            widthWallField.topAnchor.constraint(
                equalTo: heightWallField.bottomAnchor,
                constant: 20
            ),
            widthWallField.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -5
            ),
            widthWallField.heightAnchor.constraint(equalToConstant: 25),
            widthWallField.widthAnchor.constraint(equalToConstant: 165),
            
            
            widthWallLabel.topAnchor.constraint(
                equalTo: widthWallField.bottomAnchor,
                constant: 1
            ),
            widthWallLabel.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -5
            ),
            widthWallLabel.heightAnchor.constraint(equalToConstant: 10),
            widthWallLabel.widthAnchor.constraint(equalToConstant: 165),
            
            
            calculationButton.topAnchor.constraint(
                equalTo: numberOfTilesField.bottomAnchor,
                constant: 20
            ),
            calculationButton.centerXAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.centerXAnchor
            ),
            calculationButton.heightAnchor.constraint(equalToConstant: 40),
            calculationButton.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        
        numberOfTilesField.topAnchor.constraint(
            equalTo: widthWallField.bottomAnchor,
            constant: 30
        ).isActive = true
        numberOfTilesField.centerXAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.centerXAnchor
        ).isActive = true
        numberOfTilesField.heightAnchor.constraint(
            equalToConstant: 25
        ).isActive = true
        numberOfTilesField.widthAnchor.constraint(
            equalToConstant: 200
        ).isActive = true
        
        
        nameVersionLabel.bottomAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.bottomAnchor,
            constant: -5
        ).isActive = true
        nameVersionLabel.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor,
            constant: -5
        ).isActive = true
        nameVersionLabel.heightAnchor.constraint(
            equalToConstant: 10
        ).isActive = true
        nameVersionLabel.widthAnchor.constraint(
            equalToConstant: 55
        ).isActive = true
        
    }
    
    
    @objc
    private func onCalculateSquare() {
        guard let lengthOfTile = lengthTileField.text,
              let widthOfTile = widthTileField.text,
              let heightOfWall = heightWallField.text,
              let widthOfWall = widthWallField.text
        else {
            fatalError("Error")
        }
        
        presenter.onCalculateSquare(
            lengthOfTile: lengthOfTile,
            widthOfTile: widthOfTile,
            heightOfWall: heightOfWall,
            widthOfWall: widthOfWall)
    }
    
}
extension HomeViewController: HomePresenterOutput {
    func setNeedCountTiles(count: Float16) {
        numberOfTilesField.text = "\(count)"
    }
}
