//
//  LargeImageViewController.swift
//  JsonPlaceholder
//
//  Created by Dubay, Bryan on 2/14/18.
//  Copyright © 2018 Bryan Dubay. All rights reserved.
//

import UIKit

class LargeImageViewController: UIViewController {
    
    @IBOutlet var largeImageView: UIImageView!
    
    var singleData : ApiBase!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillData()
    }
    
    func fillData(){
        guard let imageUrl = singleData.thumbnailUrl,
            let photoID = singleData.id else { return }
        self.title = singleData.title
        largeImageView.loadImageUsingCache(withUrl: imageUrl, photoId: photoID)
    }
    
}
