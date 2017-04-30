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
    var title: String
    var duration: String
    var video: String
    
    init?(photo: String, title: String, duration: String, video: String) {
        
        self.photo = photo
        self.title = title
        self.duration = duration
        self.video = video

    }
    
}
