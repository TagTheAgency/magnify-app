//
//  VideoViewController.swift
//  tagvr
//
//  Created by Ira Ritchie Meek on 18/10/16.
//  Copyright © 2016 Tag the agency. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideoViewController: UIViewController {
    
    @IBOutlet weak var videoView: UIView!
    
    var video: Video?
    
    var av      :AVPlayerViewController!
    var player  :AVPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let videoURL = NSURL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
        player = AVPlayer(url: videoURL! as URL)
        av = AVPlayerViewController()
        av.player = player
        
        av.view.frame = self.videoView.bounds
        self.addChildViewController(av)
        self.videoView.addSubview(av.view)
        av.didMove(toParentViewController: self)
        
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
