//
//  HomeEventsTableViewController.swift
//  Brocante
//
//  Created by Hadrien Lepoutre on 25/05/2017.
//  Copyright © 2017 Hadrien Lepoutre. All rights reserved.
//

import UIKit

class HomeEventsTableViewController: UITableViewController {
    
    var events: [Event] = [Event]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.generateFakeDatas()
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

    // Defines the number of Rows (Cells) in each Sections.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func generateFakeDatas(){
        
        let event1 = Event()
        event1.title = "My First event"
        event1.location = "27bis Rue du Progrès, 93400 Montreuil"
        event1.user = "Ash"
        event1.year = "2017"
        event1.month = "05"
        event1.day = "28"
        event1.imageName = "img1"
        
        let event2 = Event()
        event2.title = "My Second event"
        event2.location = "164 rue Etienne Marcel, 93400 Montreuil"
        event2.user = "Brobro"
        event2.year = "2017"
        event2.month = "06"
        event2.day = "12"
        event2.imageName = "img2"

        
        let event3 = Event()
        event3.title = "My Third event"
        event3.location = "Does it still work ?"
        event3.user = "Brobro"
        event3.year = "2017"
        event3.month = "06"
        event3.day = "12"
        event3.imageName = "img1"

        // Send datas to memory
        events.append(event1)
        events.append(event2)
        events.append(event3)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // New instance for each Cell. This stores the data like in a loop.
        let oneEvent = events[indexPath.row]
        
        // Instance of the Cell that will be displayed. It needs to have the same structure than the Cell defined in the Storyboard
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCellID") as! EventTableViewCell
        
        // Instance Objects from data to link it with the CellView
        let eventTitle = String(oneEvent.title)
        let eventLocation = String(oneEvent.location)
        let eventImage = UIImage(named: oneEvent.imageName)
//        let eventUser = String(oneEvent.user)
//        let eventYear = String(oneEvent.year)
//        let eventMonth = String(oneEvent.month)
//        let eventDay = String(oneEvent.day)
        
        // Send Objects to Dynamic View
        cell.EventCellImage.image = eventImage
        cell.EventCellTitle.text = eventTitle
        cell.EventCellLocation.text = eventLocation
        
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

    
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowEventDetails" {
            print("====================================================")
            // Set Segue destination
            let detailsViewController = segue.destination as! SingleEventViewController
            // Get IndexPath of the selected Row
            let myIndexPath = self.tableView.indexPathForSelectedRow!
            let row = myIndexPath.row
            
            // Send cell data to Details View
            detailsViewController.EventPageTitle.text = events[row].title
        }
    }

}
