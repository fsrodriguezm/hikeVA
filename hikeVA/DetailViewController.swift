//
//  DetailViewController.swift
//  HikeVA
//
//  Created by Felipe Samuel Rodriguez on 12/8/16.
//  Copyright © 2016 Technigraphic. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblLength: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblElevation: UILabel!
    @IBOutlet weak var lblSolitude: UILabel!
    @IBOutlet weak var lblDifficulty: UILabel!
    @IBOutlet weak var lblStreams: UILabel!
    @IBOutlet weak var lblViews: UILabel!
    @IBOutlet weak var lblGoogleLocation: UILabel!
    @IBOutlet weak var lblWebsite: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    

    @IBOutlet weak var imgMap: UIImageView!

    
    //----------------new variables-------------------//
    
    
    @IBAction func btnSite(_ sender: Any) {
        let app = UIApplication.shared
        let urlAddress = "http://" + detailItem!.UURL
        print (urlAddress)
        
        let urlw = URL(string:urlAddress)
        app.openURL(urlw!)

    
    }
    
    @IBAction func btnMap(_ sender: UIButton) {
        let app = UIApplication.shared
        let urlAddress = "http://" + detailItem!.HikeGoogleMaps
        print (urlAddress)
        
        let urlw = URL(string:urlAddress)
        app.openURL(urlw!)
    }
    
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.lblName {
                label.text = detail.HikeName
                label.font = UIFont (name: "Zapfino", size: 20)

            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        
        lblName.text = detailItem?.HikeName
        lblTime.text = detailItem?.HikeTime
        lblViews.text = detailItem?.HikeViews
        lblLength.text = detailItem?.HikeLength
        lblStreams.text = detailItem?.HikeStreams
        lblSolitude.text = detailItem?.HikeSolitude
        lblElevation.text = detailItem?.HikeElevation
        lblDifficulty.text = detailItem?.HikeDifficulty
        lblLocation.text = detailItem?.HikeLocation

        let util = Utilities()
        
        let imageString = util.mapImages(imageName: (detailItem?.HikeImageURL)!)
        let img:UIImage = UIImage(named: imageString)!
        imgMap?.image = img
        
        let topColor = UIColor(red: (19/255.0), green: (184/255.0), blue:(142/255.0), alpha: 1)
        let bottomColor = UIColor(red: (125/255.0), green: (230/255.0), blue:(85/255.0), alpha: 1)
        
        let gradientColors: [CGColor] = [topColor.cgColor, bottomColor.cgColor]
        let gradientLocations: [Float] = [0.0, 1.0]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations as [NSNumber]?
        
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: HikeTrail? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }


}

