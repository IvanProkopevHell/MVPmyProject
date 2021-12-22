//
//  HomeRouter.swift
//  MVPmyProject
//
//  Created by Ivan Prokopyev on 21.12.2021.
//

import Foundation
import UIKit

protocol HomeRoutable: ViewRoutable {
    
}

class HomeRouter {
    
    weak var viewController: UIViewController?
    
    required init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

extension HomeRouter: HomeRoutable {
    
}
