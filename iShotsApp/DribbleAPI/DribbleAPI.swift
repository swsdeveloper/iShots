//
//  DribbleAPI.swift
//  iShotsApp
//
//  Created by Steven Shatz on 4/8/15.
//  Copyright (c) 2015 Steven Shatz. All rights reserved.
//

import Foundation

class DribbleAPI {
    
    let accessToken = "17b2556eb03879da2d4e532d3476933def9d37be6494d1d23bf7e32a0bc23e8b"
    
    func loadShots(completion: (([Shot]) -> Void)!) {
        
        var urlString = "https://api.dribbble.com/v1/shots/?access_token=" + accessToken
        
        let session = NSURLSession.sharedSession()
        let shotsUrl = NSURL(string: urlString)
        
        var task = session.dataTaskWithURL(shotsUrl!) {
            (data, response, error) -> Void in
                
            if (error != nil) {
                println(error.localizedDescription)
            } else if (data == nil) {
                println("We received no data for urlString: " + urlString)
            } else {
                
                var error : NSError?
                
                // convert the NSData returned from Dribble into a JSON Object (and cast it as an NSArray)
                // shotsData = array of dictionaries, with each item being a Dribble "shot"
                let shotsData = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error: &error) as NSArray
                
                var shots = [Shot]()
                for shot in shotsData {
                    let aShot = Shot(data: shot as NSDictionary)
                    shots.append(aShot)
                }
                
                let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
                dispatch_async(dispatch_get_global_queue(priority, 0)) {
                    dispatch_async(dispatch_get_main_queue()) {
                        println("Contents of shots array:")
                        for shotx in shots {
                            println(shotx.imageUrl)
                        }
                        completion(shots)
                    }
                }
            }
        }
        task.resume()
    }
    
}
