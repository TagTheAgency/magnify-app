//
//  VRPhoto.swift
//  tagvr
//
//  Created by Ira Ritchie Meek on 4/10/16.
//  Copyright © 2016 Tag the agency. All rights reserved.
//

import UIKit

class VRPhoto {
    
    var photo: UIImage
    var title: String
    
    init?(photo: UIImage, title: String) {
        
        self.photo = photo
        self.title = title
    }
    
}
