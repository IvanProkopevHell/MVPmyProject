//
//  HomeConfigurator.swift
//  MVPmyProject
//
//  Created by Ivan Prokopyev on 21.12.2021.
//

import Foundation

protocol HomeConfigurable {
    func configure(viewController: HomeViewController)
}

class HomeConfigurator: HomeConfigurable {
    func configure(viewController: HomeViewController) {
        let router = HomeRouter(viewController: viewController)
        
        let presenter = HomePresenter(
            output: viewController,
            router: router
        )
        viewController.presenter = presenter
    }
}


