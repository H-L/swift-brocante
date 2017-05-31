//
//  EventPageViewController.swift
//  Brocante
//
//  Created by Hadrien Lepoutre on 22/05/2017.
//  Copyright © 2017 Hadrien Lepoutre. All rights reserved.
//

import UIKit
import Firebase

class SingleEventViewController: UIViewController {

    // Image and text on top
    @IBOutlet weak var EventPageImage: UIImageView!
    @IBOutlet weak var EventPageTitle: UILabel!
    @IBOutlet weak var EventPageLocation: UILabel!
    
    // Event Choice Buttons
    @IBOutlet weak var EventChoiceGoingButton: UIButton!
    @IBOutlet weak var EventChoiceMaybeButton: UIButton!
    @IBOutlet weak var EventChoiceNotGoingButton: UIButton!
    
    // Use this to receive the Event objects from multiple rows of last view
    var singleEvent = Event()
    
    // Event Choice Actions
//    @IBAction func Going(_ sender: Any) {
//        FIRAnalytics.logEvent(withName: "going_button", parameters: nil)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        EventPageTitle.text = singleEvent.title
        EventPageLocation.text = singleEvent.location
        EventPageImage.image = UIImage(named: singleEvent.imageName)
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
