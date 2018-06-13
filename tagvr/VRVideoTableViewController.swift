//
//  VRVideoTableViewController.swift
//  tagvr
//
//  Created by Ira Ritchie Meek on 3/10/16.
//  Copyright © 2016 Tag the agency. All rights reserved.
//

import UIKit


class VRVideoTableViewController: UITableViewController {
    
    var vrVideos = [VRVideo]()
    
    @IBOutlet weak var headerImage: UIImageView!
    
    func loadSampleVideos() {
        
        getJSON(urlToRequest: "https://1819948887.rsc.cdn77.org/magnify.json")
        
    }
    
    func getJSON(urlToRequest:String) {
        let url=URL(string:urlToRequest)
        do {
            let allContactsData = try Data(contentsOf: url!)
            let allContacts = try JSONSerialization.jsonObject(with: allContactsData, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
            if let arrJSON = allContacts["videos"] as? [[String: Any]]{
                for index in 0...arrJSON.count-1 {
                    
                    let aObject = arrJSON[index] as! [String : AnyObject]
                    
                    let photoURL = aObject["photo"] as! String
                    let logoURL = aObject["logo"] as! String
                    let company = aObject["company"] as! String
                    let videoName = aObject["video"] as! String
                    
                    print(photoURL)
                    print(title)
                    
                    let video = VRVideo(photo: photoURL, logo: logoURL, company: company, video: videoName)
                    
                    vrVideos.append(video!)
                }
            }
        }
        catch {
            
        }
    }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundView = UIImageView(image: UIImage(named: "background.png")!)
        
        loadSampleVideos()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(VRVideoTableViewController.imageTapped(gesture:)))
        
        // add it to the image view;
        headerImage.addGestureRecognizer(tapGesture)
        // make sure imageView can be interacted with by user
        headerImage.isUserInteractionEnabled = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vrVideos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "VRVideoTableViewCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! VRVideoTableViewCell
        
        let vrVideo = vrVideos[indexPath.row]

        cell.coverImageView.layer.cornerRadius = 8.0
        cell.coverImageOverlay.layer.cornerRadius = 8.0
        cell.coverImageView.downloadedFrom(link: vrVideo.photo)
        cell.coverTitle.text = vrVideo.company
        
        return cell
    }
    
    func imageTapped(gesture: UIGestureRecognizer) {
        // if the tapped view is a UIImageView then set it to imageview
        if (gesture.view as? UIImageView) != nil {
            
            guard let url = URL(string: "https://gaze.tagtheagency.com/") else {
                return //be safe
            }
            UIApplication.shared.openURL(url)
            
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowVideoDetail" {
            let VRVideoDetailViewController = segue.destination as! VrVideoViewController
            
            if let selectedVRVideoCell = sender as? VRVideoTableViewCell {
                let indexPath = tableView.indexPath(for: selectedVRVideoCell)!
                let selectedVRVideo = vrVideos[indexPath.row]
                VRVideoDetailViewController.vrVideo = selectedVRVideo
            }
        }
//         Get the new view controller using segue.destinationViewController.
//         Pass the selected object to the new view controller.
    }

}
