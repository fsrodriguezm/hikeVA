//
//  JSONReceiver.swift
//  HikeVA
//
//  Created by Felipe Samuel Rodriguez on 12/8/16.
//  Copyright © 2016 Technigraphic. All rights reserved.
//

import Foundation
class JSONReceiver {

    func getJSONData() -> NSDictionary {
    
        //Specify the endpoint
        let restURL:URL = URL(string: "https://raw.githubusercontent.com/fsrodriguezm/hikeVA/master/Alltrails.json")!
        //Get the Data from the endpoint
        let jsonUrlData = try? Data (contentsOf: restURL)
        // debug info: Printing the contents in the console window
        print(jsonUrlData ?? "ERROR: No Data To Print. JSONURLData is Nil")
        // serialize the data to a Dictionary
        if(jsonUrlData != nil){
            let dictionary:NSDictionary =
                (try! JSONSerialization.jsonObject(with: jsonUrlData!, options: JSONSerialization.ReadingOptions.mutableContainers)) as! NSDictionary
            print(dictionary)
            return dictionary
        }
        return ["nil":"nil"]
    }
   
    func populateHikeTrailJSONArray() -> [HikeTrail] {
        var HikeTrailJSONArray = [HikeTrail]()
        
        
        let dictionary = self.getJSONData()
        let hikeTrailDetails = dictionary["HikeTrails"]! as! [[String:AnyObject]]

        for index in 0...hikeTrailDetails.count - 1
        {
            let single = hikeTrailDetails[index]
            
            let su = HikeTrail(location:single["HikeLocation"] as! String, hid:single["HikeID"] as! String, name:single["HikeName"] as! String, imageurl:single["HikeImageURL"] as! String, length:single["HikeLength"] as! String, time:single["HikeTime"] as! String, elevation:single["HikeElevation"] as! String, difficulty: single["HikeDifficulty"] as! String, streams:single["HikeStreams"] as! String, views:single["HikeViews"] as! String, solitude:single["HikeSolitude"] as! String, map:single["HikeGoogleMaps"] as! String, uurl:single["HikeURL"] as! String)
            
            HikeTrailJSONArray.append(su)
        }
        
        
        return HikeTrailJSONArray
    }




}














