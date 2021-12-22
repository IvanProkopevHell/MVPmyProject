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
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(onButtonClick), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(viewController: self)
        presenter.viewDidLoad()
        
        setupLayout()
        }
    
    private func setupLayout() {
        [button].forEach(view.addSubview)
    }

    @objc
    private func onButtonClick() {
        presenter.onButtonClick()
    }

}

extension HomeViewController: HomePresenterOutput {
    
}
