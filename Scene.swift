//
//  Scene.swift
//  My-Life-is-a-Movie
//
//  Created by Anthony Torrero Collins on 2/18/16.
//  Copyright © 2016 Anthony Torrero Collins. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Scene: NSManagedObject {

    func setSceneImage(img: UIImage) {
        
        let data = UIImagePNGRepresentation(img)
        self.image = data
        
    }
    
    func getSceneImage() -> UIImage {

        let img = UIImage(data: self.image!)!
        return img

    }



//        self.sceneDesc = newValue
//        self.sceneTitle = newValue
//        self.dateShot = newValue
    
    
}
