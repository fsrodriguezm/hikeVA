//
//  Utilities.swift
//  HikeVA
//
//  Created by Felipe Samuel Rodriguez on 12/8/16.
//  Copyright © 2016 Technigraphic. All rights reserved.
//

import Foundation
class Utilities
{
    func mapImages(imageName: String) -> String {
        switch imageName {
        case "frp.jpg":
            return "frp.jpg"
        case "mnsp.jpg":
            return "mnsp.jpg"
        case "horp.jpg":
            return "horp.jpg"
        case "blp.jpg":
            return "blp.jpg"
        case "brp.jpg":
            return "brp.jpg"
            
        default: return "Gmu.jpeg"
        }
        
        
    }



}
