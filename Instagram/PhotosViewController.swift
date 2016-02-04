//
//  ViewController.swift
//  Instagram
//
//  Created by Isis Anchalee on 2/3/16.
//  Copyright © 2016 Isis Anchalee. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var photoModels: [PhotoModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        let client_id = "e05c462ebd86446ea48a5af73769b602"
        let url = NSURL(string: "https://api.instagram.com/v1/media/popular?client_id=\(client_id)")
        
        let request = NSURLRequest(URL: url!)
        let session = NSURLSession(
            configuration: NSURLSessionConfiguration.defaultSessionConfiguration(),
            delegate:nil,
            delegateQueue:NSOperationQueue.mainQueue()
        )
        
        let task : NSURLSessionDataTask = session.dataTaskWithRequest(request,
            completionHandler: { (dataOrNil, response, error) in
                if let data = dataOrNil {
                    if let responseDictionary = try! NSJSONSerialization.JSONObjectWithData(
                        data, options:[]) as? NSDictionary {
                            let photosArr: NSArray = (responseDictionary["data"] as? NSArray)!
                            
                            for photo in photosArr {
                                self.photoModels.append(PhotoModel(json: (photo as? NSDictionary)!))
                            }
                            
                            self.tableView.reloadData()

                    }
                }
        });
        
        task.resume()
        
        tableView.rowHeight = 320
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.photoModels.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PhotoCell", forIndexPath: indexPath) as! PhotoCellView
        let photo = photoModels[indexPath.row]
        let photoUrl = NSURL(string: photo.url!)
        cell.photoImageView.setImageWithURL(photoUrl!)
        

        return cell
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var vc = segue.destinationViewController as! PhotoDetailsViewController
        var indexPath = tableView.indexPathForCell(sender as! UITableViewCell)
        var photo = photoModels[indexPath!.row]
    }
}

