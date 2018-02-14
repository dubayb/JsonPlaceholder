//
//  ImageTableViewCell.swift
//  JsonPlaceholder
//
//  Created by Dubay, Bryan on 2/14/18.
//  Copyright © 2018 Bryan Dubay. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
