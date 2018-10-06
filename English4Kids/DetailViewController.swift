//
//  DetailViewController.swift
//  English4Kids3
//
//  Created by macbook on 9/28/18.
//  Copyright © 2018 Viet. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    // Title for navigation bar.
    var stringTitle: String!
    
    // Get data from .plist
    var dictData: NSDictionary!
    
    // Get keys from a dictionary.
    var arrayKeys: NSArray!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the delegate and dataSource for tableView.
        tableView.delegate = self
        tableView.dataSource = self
        
        // Set the title of the navigation bar.
        title = stringTitle
        
        // Initial data for DetailViewController
        initDataByTitle(stringTitle)

    }
    
    // Create data from .plist file
    func initDataByTitle(title: String) -> Void {
        
        // Get an address of .plist
        let path = title == "Fruits" ? NSBundle.mainBundle().pathForResource("FruitsList", ofType: "plist")! : title == "Animals" ? NSBundle.mainBundle().pathForResource("AnimalsList", ofType: "plist")! : title == "Linh Ka" ? NSBundle.mainBundle().pathForResource("LinhKaPhotoList", ofType: "plist")! : ""
        
        dictData = NSDictionary(contentsOfFile: path)
        
        arrayKeys = dictData.allKeys
        
        // Set data to follow the letter (abc) order.
        arrayKeys = arrayKeys.sortedArrayUsingSelector(#selector(NSNumber.compare(_:)))
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayKeys.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Set cells for DetailViewController by an index in MasterTableVC
        let cell = tableView.dequeueReusableCellWithIdentifier("DetailCell", forIndexPath: indexPath)
        
        let key = arrayKeys[indexPath.row] as! String
        
        cell.textLabel?.text = key
        
        cell.imageView?.image = UIImage(named: "\(dictData[key]!)")
        
        return cell
        
    }
    
    // Height for Cell
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75
    }
    
    // Event for Cell
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("...\(indexPath.row)")
    }
    
    // Data for SubDetail
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Select the segue where name = "ShowSub"
        if segue.identifier == "ShowSub" {
            
            // Initial a view controller where data is going to be moved to.
            let subDetailViewController = segue.destinationViewController as! SubDetailViewController
            
            // Get an index path of the selected row.
            let selectedRowIndex = tableView.indexPathForSelectedRow
            
            // Get a cell by the index path.
            let selectedCell = tableView.cellForRowAtIndexPath(selectedRowIndex!)
            
            // ImageName for ImageView in SubDetailViewController
            let key = selectedCell?.textLabel?.text
            let imageName = dictData.valueForKey(key!) as! String
            subDetailViewController.imageName = imageName
            
        }
    }
    
    
    
    
    
    
    
    
    

}
