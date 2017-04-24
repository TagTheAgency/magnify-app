//
//  ViewController.swift
//  tagvr
//
//  Created by Ira Ritchie Meek on 22/08/16.
//  Copyright © 2016 Tag the agency. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var menuPanoView: GVRPanoramaView!
    
    var vrVideo: VRVideo?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
//        self.menuPanoView.load(UIImage(named: "tokyo-360")!, of: GVRPanoramaImageType.mono)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

