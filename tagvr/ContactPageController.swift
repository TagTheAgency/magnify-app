//
//  ContactPageController.swift
//  tagvr
//
//  Created by Tag User #1 on 11/10/16.
//  Copyright © 2016 Tag the agency. All rights reserved.
//

import UIKit
import MessageUI

class ContactPageController: UIViewController, MFMailComposeViewControllerDelegate {

    
    @IBOutlet weak var contactName: UITextField!
    @IBOutlet weak var contactEmail: UITextField!
    @IBOutlet weak var contactMessage: UITextField!
    @IBOutlet weak var messageStatus: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        messageStatus.text = ""
        messageStatus.layer.borderWidth = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendMessage(_ sender: AnyObject) {
        let toRecipients = ["ira@tagtheagency.com"]
        let mc: MFMailComposeViewController = MFMailComposeViewController()
        if (MFMailComposeViewController.canSendMail()) {
            mc.mailComposeDelegate = self
            mc.setToRecipients(toRecipients)
            mc.setSubject(contactName.text!)
            mc.setMessageBody("Name: \(contactName.text!) \n\nEmail: \(contactEmail.text!) \n\nMessage: \(contactMessage.text!)", isHTML: false)
            self.present(mc, animated: true, completion: nil)
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        switch result.rawValue {
        case MFMailComposeResult.cancelled.rawValue:
            print("Cancelled")
        case MFMailComposeResult.failed.rawValue:
            print("Failed")
            messageStatus.text = "Message failed to send."
            messageStatus.layer.borderWidth = 1
            messageStatus.layer.borderColor = UIColor.red.cgColor
            messageStatus.layer.cornerRadius = 5
        case MFMailComposeResult.saved.rawValue:
            print("Saved")
        case MFMailComposeResult.sent.rawValue:
            print("Sent")
            messageStatus.text = "Message sent, thanks!"
            messageStatus.layer.borderWidth = 1
            messageStatus.layer.borderColor = UIColor.green.cgColor
            messageStatus.layer.cornerRadius = 5
        default:
            break
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func dismissKeyboard(_ sender: AnyObject) {
        self.resignFirstResponder()
    }
    
}
