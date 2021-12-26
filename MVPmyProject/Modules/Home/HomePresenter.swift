//
//  HomePresenter.swift
//  MVPmyProject
//
//  Created by Ivan Prokopyev on 21.12.2021.
//

import Foundation
import UIKit

protocol HomePresenterInput: BasePresenterInput {
    
    var router: HomeRoutable { get }
    
    func onButtonClick(lengthOfTile: String, widthOfTile: String, heightOfWall: String, widthOfWall: String)
    
    func viewDidLoad()
}

protocol HomePresenterOutput: BasePresenterOutput {
    
}


class HomePresenter {
    
    private weak var output: HomePresenterOutput?
    var router: HomeRoutable
    
    init(output: HomePresenterOutput, router: HomeRoutable) {
        
        self.output = output
        self.router = router
    }
    
}

extension HomePresenter: HomePresenterInput {
    
    func viewDidLoad() {
        print("viewDidLoad")
    }
    
    func onButtonClick(lengthOfTile: String, widthOfTile: String, heightOfWall: String, widthOfWall: String) {
        print("onButtonClick()", lengthOfTile, widthOfTile, heightOfWall, widthOfWall)
    }
}
