//
//  MasterViewController.swift
//  HikeVA
//
//  Created by Felipe Samuel Rodriguez on 12/8/16.
//  Copyright © 2016 Technigraphic. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
  var hikeTrailArray = [HikeTrail]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let JR = JSONReceiver()
       hikeTrailArray = JR.populateHikeTrailJSONArray()
        
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedHikeTrail = hikeTrailArray[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = selectedHikeTrail
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hikeTrailArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let selectedHikeTrail = hikeTrailArray[indexPath.row]
        cell.textLabel!.text = selectedHikeTrail.HikeName
        cell.detailTextLabel!.text = selectedHikeTrail.HikeLocation
        
        let util = Utilities()
        
        let imageString = util.mapImages(imageName: selectedHikeTrail.HikeImageURL)
        
        let img:UIImage = UIImage(named: imageString)!
        cell.imageView?.image = img
        
        return cell
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }
    
        
    
    

}

