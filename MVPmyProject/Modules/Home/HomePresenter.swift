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
    
    func onCalculateSquare(lengthOfTile: String,
                           widthOfTile: String,
                           heightOfWall: String,
                           widthOfWall: String)
    
    func viewDidLoad()
}

protocol HomePresenterOutput: BasePresenterOutput {
    func setNeedCountTiles(count: Float16)
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
    
    func onCalculateSquare(
        lengthOfTile: String,
        widthOfTile: String,
        heightOfWall: String,
        widthOfWall: String
    ) {
        guard let lengthTile = Float16(lengthOfTile),
              let widthTile = Float16(widthOfTile),
              let heightWall = Float16(heightOfWall),
              let widthWall = Float16(widthOfWall)
        else {
            return
        }
        
        let squareOfTile = lengthTile * widthTile
        let squareOfWall = heightWall * widthWall
        
        output?.setNeedCountTiles(count: squareOfWall/squareOfTile)
    }
}
