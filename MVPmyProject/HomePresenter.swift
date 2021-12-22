//
//  HomePresenter.swift
//  MVPmyProject
//
//  Created by Ivan Prokopyev on 21.12.2021.
//

import Foundation

protocol HomePresenterInput: BasePresenterInput {
    
    var router: HomeRoutable { get }
    
    func onButtonClick()
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
        
    }
    
    func onButtonClick() {
        print("onButtonClick()")
    }
}
