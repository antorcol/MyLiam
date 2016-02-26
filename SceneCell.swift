//
//  SceneCell.swift
//  My-Life-is-a-Movie
//
//  Created by Anthony Torrero Collins on 2/16/16.
//  Copyright © 2016 Anthony Torrero Collins. All rights reserved.
//

/*
    This class just holds the custom labels and image for the scene 
    mentioned in a post. The cell mirrors the content in
    the Scene class instance (this is the view for the Scene model).
*/


import UIKit

class SceneCell: UITableViewCell {
    
    @IBOutlet weak var imgScene: UIImageView! //the user's photo
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSceneDesc: UILabel!
    @IBOutlet weak var lblDateShot: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        //trim the image
        imgScene.layer.cornerRadius = CGFloat(5.0)
        imgScene.clipsToBounds = true
    }
    
    
    func limitString(original: String, limit: Int) -> String {
        
        var retVal: String = original
        
        if(original.characters.count > limit) {
            let idx = original.startIndex.advancedBy(limit)
            var tempStr : String = (original.substringToIndex(idx))
            tempStr.appendContentsOf("...")
            retVal = tempStr
            
        }
        
        return retVal
    }
    
    
    func configureCell(scene: Scene) {
        
        let TITLE_MAX = 30
        let DESC_MAX = 40
        
        //limit the length of the title for the table view
        if let tmpTitle = scene.sceneTitle {
            self.lblTitle.text = limitString(tmpTitle, limit: TITLE_MAX);
        }
        
        //limit the length of the description for the table view
        if let tmpDesc = scene.sceneDesc {
            self.lblSceneDesc.text = limitString(tmpDesc, limit: DESC_MAX)
        }
        
  
        //TODO: Format the date time string just for short date
//        let dateFormatter = NSDateFormatter()
//        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
//        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
//        
//        if let nDate = dateFormatter.dateFromString(scene.dateShot!) {
//            self.lblDateShot.text = dateFormatter.stringFromDate(nDate)
//        } else {
            self.lblDateShot.text = scene.dateShot
//        }
        
        //image
        self.imgScene.image = scene.getSceneImage()
        
    }
}