//
//  Shot.swift
//  iShotsApp
//
//  Created by Steven Shatz on 4/8/15.
//  Copyright (c) 2015 Steven Shatz. All rights reserved.
//

import Foundation

class Shot {
    
    var id : Int!
    var title : String!
    var date : String!
    var description : String!
    var commentCount : Int!
    var likesCount : Int!
    var viewsCount : Int!
    var commentsUrl : String!
    var imageUrl : String!
    
    var imageData : NSData?
    
    var user : User!
    
    init(data : NSDictionary) {
        
        self.id = data["id"] as Int
        self.commentCount = data["comments_count"] as Int
        self.likesCount = data["likes_count"] as Int
        self.viewsCount = data["views_count"] as Int
        
        self.commentsUrl = Utils.getStringFromJSON(data, key:"comments_url")
        self.title = Utils.getStringFromJSON(data, key:"title")
        self.date = Utils.getStringFromJSON(data, key:"created_at")
        self.description = Utils.getStringFromJSON(data, key:"description")
        
        let images = data["images"] as NSDictionary
        self.imageUrl = Utils.getStringFromJSON(images, key:"normal")
        
        //println("- url = \(self.imageUrl)")
        
        if let userData = data["user"] as? NSDictionary {
            self.user = User(data: userData)
        }
        
    }
    
}
