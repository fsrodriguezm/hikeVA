//
//  HikeTrail.swift
//  hikeVA
//
//  Created by Felipe Samuel Rodriguez on 12/11/16.
//  Copyright © 2016 Technigraphic. All rights reserved.
//

import Foundation

import Foundation
class HikeTrail {
    var HikeLocation:String = ""
    var HId:String = ""
    var HikeName:String = ""
    var HikeImageURL:String = ""
    var HikeLength:String = ""
    var HikeTime:String = ""
    var HikeElevation:String = ""
    var HikeDifficulty:String = ""
    var HikeStreams:String = ""
    var HikeViews:String = ""
    var HikeSolitude:String = ""
    var HikeGoogleMaps:String = ""
    var UURL:String = ""

    
    init(location:String, hid:String,  name:String, imageurl:String, length:String, time:String, elevation:String, difficulty:String, streams:String, views:String, solitude:String, map:String, uurl:String) {
        self.HId = hid
        self.HikeLocation = location
        self.HikeName = name
        self.HikeImageURL = imageurl
        self.HikeLength = length
        self.HikeTime = time
        self.HikeElevation = elevation
        self.HikeDifficulty = difficulty
        self.HikeStreams = streams
        self.HikeViews = views
        self.HikeSolitude = solitude
        self.HikeGoogleMaps = map
        self.UURL = uurl
    }
    

}
