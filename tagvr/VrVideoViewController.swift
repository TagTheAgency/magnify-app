//
//  VrVideoViewController.swift
//  tagvr
//
//  Created by Ira Ritchie Meek on 18/10/16.
//  Copyright © 2016 Tag the agency. All rights reserved.
//

import UIKit

class VrVideoViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var videoVRView: GVRVideoView!
    
    var vrVideo: VRVideo?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let vrVideo = vrVideo {
            videoVRView.load(from: URL(string: vrVideo.video))
            videoVRView.enableCardboardButton = true
            videoVRView.enableFullscreenButton = true
            titleLabel.text = vrVideo.title
            durationLabel.text = vrVideo.duration
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
