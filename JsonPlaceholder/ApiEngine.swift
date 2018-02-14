//
//  ApiEngine.swift
//  JsonPlaceholder
//
//  Created by Dubay, Bryan on 2/13/18.
//  Copyright © 2018 Bryan Dubay. All rights reserved.
//

import Foundation

struct ApiEngine {
//    var apiDelegate:ApiDelegate!
//    var apiBase: [ApiBase]!
//    init(apiDelegate:ApiDelegate) {
//        self.apiDelegate = apiDelegate
////        getJsonData()
//    }
    
    func getJsonData<A>(completion:@escaping ( ApiDataResult<A> ) -> Void ){
        let url = URL(string: "https://jsonplaceholder.typicode.com/photos")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do {
                let jsonDecoder = JSONDecoder()
                let apiBase = try jsonDecoder.decode([ApiBase].self, from: data!)
                completion(ApiDataResult.Value(apiBase))
//                self.apiDelegate.handleData(result: apiBase)
            } catch {
                completion(ApiDataResult.Error(error.localizedDescription))
//                self.apiDelegate.handleError(error: error)
            }
            
        }
        task.resume()
    }
    
}
enum ApiDataResult<T> {
    case Value([ApiBase])
    case Error(String)
}
//protocol ApiDelegate {
//    func handleData(result:[ApiBase])
//    func handleError(error:Error)
//}

