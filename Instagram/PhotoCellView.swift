//
//  PhotoCellView.swift
//  Instagram
//
//  Created by Isis Anchalee on 2/3/16.
//  Copyright © 2016 Isis Anchalee. All rights reserved.
//

import UIKit
import AFNetworking

class PhotoCellView: UITableViewCell {

    
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepare(){
    
    }
}
