//
//  PhotoModel.swift
//  Instagram
//
//  Created by Isis Anchalee on 2/3/16.
//  Copyright © 2016 Isis Anchalee. All rights reserved.
//

import UIKit

class PhotoModel: NSObject {
    var url: String?
    var username: String?
    var profilePicture: String?
    
    init(json: NSDictionary){
        if let url = json["images"]!["standard_resolution"]!!["url"]{
            self.url = url as? String
        }
        if let username = json["user"]!["username"]{
            self.username = username as? String
        }
        if let profilePicture = json["user"]!["profile_picture"]{
            self.profilePicture = profilePicture as? String
        }
    }
}
