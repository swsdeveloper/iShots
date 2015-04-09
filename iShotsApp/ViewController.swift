//
//  ViewController.swift
//  iShotsApp
//
//  Created by Steven Shatz on 4/8/15.
//  Copyright (c) 2015 Steven Shatz. All rights reserved.
//

// Steps:
// 1. Write DribbleAPI.swift
//      Test: Make sure we connect to Dribble API and confirm that we get data and a good response code
// 2. Parse data received from Dribble API (added: Shot.swift)
//      Test: Make sure we get good JSON data and that we create valid shots array
// 3. Add Theme.swift - for setting fonts
// 4. Set up ShotsGridController.swift and ShotCell.swift to populate Collection View
// 5. Set up simple Storyboard and connect the Outlets
//      Test: Make sure we get a Collection View that looks OK and has Title Labels
// 6. Update ShotsGridController.swift to asynchronously download images to Collection View cells
//      Test: Make sure our Collection View now has images
// 7. Get user info (create User.swift and refactor JSON processing into Utils.swift)
//      Test: Make sure our Collection View now has User (aka Name) Labels

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let api = DribbleAPI()
        api.loadShots(nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

