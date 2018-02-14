//
//  ImageListTableViewController.swift
//  JsonPlaceholder
//
//  Created by Dubay, Bryan on 2/14/18.
//  Copyright © 2018 Bryan Dubay. All rights reserved.
//

import UIKit

class ImageListTableViewController: UITableViewController {
    let segueID = "ShowImage"
    var apiEngine = ApiEngine()
    var apiBase : [ApiBase]! {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        self.title = "Json Placeholder"
    }
    
    func loadData(){
        apiEngine.getJsonData { (result : ApiDataResult<Any>) in
            DispatchQueue.main.async {
                switch result {
                case .Value(let apiBase):
                    self.apiBase = apiBase
                case .Error(let error):
                    self.showNetworkErrorAlert(errorTitle:error)
                }
            }
        }
    }
   
    
    
    func showNetworkErrorAlert(errorTitle:String){
        let alertController = UIAlertController(title: errorTitle, message: "try again?", preferredStyle: UIAlertControllerStyle.alert)
        let cancelAction = UIAlertAction(title: "No thanks", style: UIAlertActionStyle.cancel) { (result : UIAlertAction) -> Void in
            
        }
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            self.loadData()
        }
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
//UITableViewDelegate
extension ImageListTableViewController  {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //present larger image
        self.performSegue(withIdentifier: segueID, sender: indexPath.row)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueID {
            let vc = segue.destination as! LargeImageViewController
            vc.singleData = apiBase[sender as! Int]
        }
    }
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
//UITableViewDataSource
extension ImageListTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apiBase?.count ?? 0
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ImageTableViewCell
        let indexedData = apiBase[indexPath.row]
        cell.titleLabel?.text = apiBase[indexPath.row].title
        guard let imageUrl = indexedData.thumbnailUrl, let photoID = indexedData.id else { return cell }
        cell.imgView.loadImageUsingCache(withUrl: imageUrl, photoId: photoID)
        return cell
    }
}

