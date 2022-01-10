//
//  HomeTableView.swift
//  MVPmyProject
//
//  Created by Ivan Prokopyev on 02.01.2022.
//

import UIKit

class HomeTableView: UITableView {
  
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        dataSource = self
        
        register(UITableViewCell.self, forCellReuseIdentifier: "default")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
    extension HomeTableView: UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            2
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "default", for: indexPath)
            cell.textLabel?.text = "helio"
            return cell
        }
        
    }




