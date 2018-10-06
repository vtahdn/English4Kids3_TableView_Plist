//
//  MasterTableVC.swift
//  English4Kids
//
//  Created by macbook on 9/26/18.
//  Copyright © 2018 Viet. All rights reserved.
//

import UIKit

class MasterTableVC: UITableViewController {
    
    var dictList = ["Fruits" : "fruits.png", "Animals" : "animals.jpeg", "Linh Ka" : "LinhKa.jpg"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return dictList.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        var arrayKey = Array(dictList.keys)
        
        let size = dictList.count
        let index = size - indexPath.row - 1
        
        cell.textLabel?.text = arrayKey[index]
        cell.imageView?.image = UIImage(named: dictList["\(arrayKey[index])"]!)

        return cell
    }
    
    // Take data from MasterTableVC to DetailViewController by a "segue" in the Main.storyboard
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Select the segue where name = "ShowDetail"
        if segue.identifier == "ShowDetail" {
            
            // Initial a view controller where data is going to be moved to.
            let detailViewController = segue.destinationViewController as! DetailViewController
            
            // Get an index path of the selected row.
            let selectedRowIndex = tableView.indexPathForSelectedRow
            
            // Get a cell by the index path.
            let selectedCell = tableView.cellForRowAtIndexPath(selectedRowIndex!)
            
            // Take the stringTitle to the textlabel of the selected cell.
            detailViewController.stringTitle = selectedCell?.textLabel?.text
        }
    }
    

}
