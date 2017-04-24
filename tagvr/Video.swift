//
//  Video.swift
//  tagvr
//
//  Created by Ira Ritchie Meek on 19/10/16.
//  Copyright © 2016 Tag the agency. All rights reserved.
//

import Foundation

class Video {
    
    var photo: UIImage
    var title: String
    var duration: String
    var video: String
    
    init?(photo: UIImage, title: String, duration: String, video: String) {
        
        self.photo = photo
        self.title = title
        self.duration = duration
        self.video = video
    }
    
}
