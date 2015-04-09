//
//  ShotsGridController.swift
//  iShotsApp
//
//  Created by Steven Shatz on 4/8/15.
//  Copyright (c) 2015 Steven Shatz. All rights reserved.
//

import Foundation
import UIKit

class ShotsGridController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var collectionView : UICollectionView!
    @IBOutlet var layout : UICollectionViewFlowLayout!
    
    var shots : [Shot]!
    var cellHeight : CGFloat = 240
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Shots"    // VC title

        let screenSize = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        let cellWidth = screenWidth / 2.0
        
        layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSizeMake(cellWidth, cellHeight)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.clearColor()
        
        shots = [Shot]()
        let api = DribbleAPI()
        
        // we pass a completion block to DribbleAPI's loadShots method
        // the completion block is of the form: [Shot] -> Void
        // our method didLoadShots is also of the form: [Shot] -> Void
        // so just specifying the name of our method is sufficient
        
        api.loadShots(didLoadShots)
    }
    
    func didLoadShots(shots: [Shot]) {
        self.shots = shots
        collectionView.reloadData()
    }
    
    // MARK: - UICollectionView Data Source, Delegate, and Helper methods
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ShotCell", forIndexPath: indexPath) as ShotCell
        
        let shot = shots[indexPath.row]
        cell.titleLabel.text = shot.title
        cell.nameLabel.text = shot.user.name
        
        asyncLoadShotImage(shot, imageView: cell.coverImageView)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shots.count
    }
    
    func asyncLoadShotImage(shot: Shot, imageView: UIImageView) {
        
        println("Downloading: \(shot.imageUrl) ...")
        
        let downloadQueue = dispatch_queue_create("com.iShots.processDownload", nil)
        
        dispatch_async(downloadQueue) {
            var data = NSData(contentsOfURL: NSURL(string: shot.imageUrl)!)
            
            var image : UIImage?
            if data == nil {
                println("Error: Data is nil (when downloading image)")
            } else {
                shot.imageData = data
                image = UIImage(data: data!)
            
                dispatch_async(dispatch_get_main_queue()) {
                    imageView.image = image
                }
            }
        }
    }
    
//    // MARK: - CollectionViewDelegateFlowLayout
//    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
//    {
//        let size = CGSizeMake( (self.view.frame.width / 2.0) - 16, cellHeight)
//        return size
//    }
//    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat
//    {
//        return 0
//    }
//    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat
//    {
//        return 0
//    }
// 
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets
//    {
//        return UIEdgeInsetsMake(0, 0, 0, 0)   //top, left, bottom, right
//    }
    
}
