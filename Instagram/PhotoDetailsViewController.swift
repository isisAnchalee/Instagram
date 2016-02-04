//
//  PhotoDetailsViewController.swift
//  Instagram
//
//  Created by Isis Anchalee on 2/3/16.
//  Copyright © 2016 Isis Anchalee. All rights reserved.
//

import UIKit

class PhotoDetailsViewController: UIViewController {

    @IBOutlet weak var photoDetailImageView: UIImageView!
    
    var photo: PhotoModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let photoUrl = NSURL(string: photo!.url!)
        print(photoUrl)
        photoDetailImageView.setImageWithURL(photoUrl!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
