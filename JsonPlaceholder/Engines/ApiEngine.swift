//
//  ApiEngine.swift
//  JsonPlaceholder
//
//  Created by Dubay, Bryan on 2/13/18.
//  Copyright © 2018 Bryan Dubay. All rights reserved.
//

import Foundation

struct ApiEngine {
    
    func getJsonData<A>(completion:@escaping ( ApiDataResult<A> ) -> Void ){
        let url = URL(string: "https://jsonplaceholder.typicode.com/photos")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do {
                let jsonDecoder = JSONDecoder()
                let apiBase = try jsonDecoder.decode([ApiBase].self, from: data!)
                completion(ApiDataResult.Value(apiBase))
            } catch {
                completion(ApiDataResult.Error(error.localizedDescription))
            }
            
        }
        task.resume()
    }
    
}
enum ApiDataResult<T> {
    case Value([ApiBase])
    case Error(String)
}
