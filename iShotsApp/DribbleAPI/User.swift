//
//  User.swift
//  iShotsApp
//
//  Created by Steven Shatz on 4/8/15.
//  Copyright (c) 2015 Steven Shatz. All rights reserved.
//

import Foundation

class User {

    var userID : Int!
    var avatarUrl : String!
    var name : String!
    var location : String!
    var followingCount : Int!
    var followersCount : Int!
    var shotsCount : Int!
    
    var shotsUrl : String!
    var followingUrl : String!
    
    var avatarData : NSData?
    
    init(data: NSDictionary) {
        userID = data["id"] as Int
        name = Utils.getStringFromJSON(data, key: "name")
        avatarUrl = Utils.getStringFromJSON(data, key: "avatar_url")
        location = Utils.getStringFromJSON(data, key: "location")
        
        followingCount = data["followings_count"] as Int
        followersCount = data["followers_count"] as Int
        shotsCount = data["shots_count"] as Int
        
        shotsUrl = Utils.getStringFromJSON(data, key: "shots_url")
        followingUrl = Utils.getStringFromJSON(data, key: "following_url")

//        avatarData = 
    }

}