//
//  VRPhotoTableViewController.swift
//  tagvr
//
//  Created by Ira Ritchie Meek on 14/10/16.
//  Copyright © 2016 Tag the agency. All rights reserved.
//

import UIKit

class VRPhotoTableViewController: UITableViewController {
    
    var vrPhotos = [VRPhoto]()
    
    func loadSamplePhotos() {
        let photo1 = VRPhoto(photo: UIImage(named: "beach-360")!, title: "Beach")!
        
        let photo2 = VRPhoto(photo: UIImage(named: "park-360")!, title: "Park")!
        
        let photo3 = VRPhoto(photo: UIImage(named: "cave-360")!, title: "Cave")!
        
        let photo4 = VRPhoto(photo: UIImage(named: "oriental_parade-360")!, title: "Oriental Parade")!
        
        let photo5 = VRPhoto(photo: UIImage(named: "pier-360")!, title: "Pier")!
        
        let photo6 = VRPhoto(photo: UIImage(named: "tokyo-360")!, title: "Tokyo")!
        
        let photo7 = VRPhoto(photo: UIImage(named: "cafe-360")!, title: "Cafe")!
        
        vrPhotos += [photo1, photo2, photo3, photo4, photo5, photo6, photo7]
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        loadSamplePhotos()

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
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vrPhotos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "VRPhotoTableViewCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! VRPhotoTableViewCell

        let vrPhoto = vrPhotos[indexPath.row]
        
        cell.photoView.image = vrPhoto.photo
        cell.title.text = vrPhoto.title

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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowPhotoDetail" {
            let VRPhotoDetailViewController = segue.destination as! PanoramaViewController
            
            if let selectedVRPhotoCell = sender as? VRPhotoTableViewCell {
                let indexPath = tableView.indexPath(for: selectedVRPhotoCell)!
                let selectedVRPhoto = vrPhotos[indexPath.row]
                VRPhotoDetailViewController.vrPhoto = selectedVRPhoto
            }
        }
    }
}
