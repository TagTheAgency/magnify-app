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
    
    func loadSampleVideos() {
        let photo1 = UIImage(named: "image1")!
        let video1 = VRVideo(photo: photo1, title: "Soaring with Orcas", duration: "2:52", video: "https://s3.amazonaws.com/ray.wenderlich/elephant_safari.mp4")!
        
        let photo2 = UIImage(named: "image2")!
        let video2 = VRVideo(photo: photo2, title: "Road Trip New Zealand", duration: "1:29", video: "https://s3.amazonaws.com/ray.wenderlich/elephant_safari.mp4")!
        
        let photo3 = UIImage(named: "image3")!
        let video3 = VRVideo(photo: photo3, title: "Aventador Test", duration: "3:12", video: "https://s3.amazonaws.com/ray.wenderlich/elephant_safari.mp4")!
        
        vrVideos += [video1, video2, video3]

    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleVideos()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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

        cell.coverImageView.image = vrVideo.photo
        cell.coverTitle.text = vrVideo.title
        
        return cell
    }
 
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

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
