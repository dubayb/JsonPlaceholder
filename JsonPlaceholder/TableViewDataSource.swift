//
//  TableViewDataSource.swift
//  JsonPlaceholder
//
//  Created by Dubay, Bryan on 2/13/18.
//  Copyright © 2018 Bryan Dubay. All rights reserved.
//

import Foundation
import UIKit

class TableViewDataSource : NSObject , UITableViewDataSource {
    
    var apiBase: [ApiBase]!
    init(data:[ApiBase]) {
        super.init()
        self.apiBase = data
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apiBase.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = apiBase[indexPath.row].title
//        cell?.imageView.image = UIImage.init(data: apiBase[indexPath.row].thumbnailUrl, scale: <#T##CGFloat#>)
        return cell!
    }
    
    
    
}
