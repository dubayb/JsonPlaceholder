//
//  ImageEngine.swift
//  JsonPlaceholder
//
//  Created by Dubay, Bryan on 2/13/18.
//  Copyright © 2018 Bryan Dubay. All rights reserved.
//

import Foundation
import UIKit

let imageCache = NSCache<NSString, AnyObject>()

extension UIImageView {
    func loadImageUsingCache(withUrl urlString : String, photoId:Int) {
        let url = URL(string: urlString)
        self.image = nil
        if let cachedImage = imageCache.object(forKey: String(photoId) as NSString ) as? UIImage {
            self.image = cachedImage
            return
        }
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data!) {
                    imageCache.setObject(image, forKey: urlString as NSString)
                    self.image = image
                }
            }
            
        }).resume()
    }
}
