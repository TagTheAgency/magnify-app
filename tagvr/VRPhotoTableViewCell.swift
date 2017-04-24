//
//  VRPhotoTableViewCell.swift
//  tagvr
//
//  Created by Ira Ritchie Meek on 12/10/16.
//  Copyright © 2016 Tag the agency. All rights reserved.
//

import UIKit

class VRPhotoTableViewCell: UITableViewCell {

    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
