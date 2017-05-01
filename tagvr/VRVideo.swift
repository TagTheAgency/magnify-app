//
//  VRVideo.swift
//  tagvr
//
//  Created by Ira Ritchie Meek on 4/10/16.
//  Copyright © 2016 Tag the agency. All rights reserved.
//

import UIKit

class VRVideo {
    
    var photo: String
    var company: String
    var logo: String
    var video: String
    
    init?(photo: String, logo: String, company: String, video: String) {
        
        self.photo = photo
        self.company = company
        self.logo = logo
        self.video = video

    }
    
}
