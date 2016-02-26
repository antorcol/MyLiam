//
//  ScenePost.swift
//  My-Life-is-a-Movie
//
//  Created by Anthony Torrero Collins on 2/16/16.
//  Copyright © 2016 Anthony Torrero Collins. All rights reserved.
//

import Foundation

/*
    Model for a scene post, which includes an image, a title, a date, and a description.
    The image is here represented only by a path.
    The view for this model is the SceneCell.
*/
class ScenePost: NSObject, NSCoding {
    
    //MARK: privates
    private var _title: String!
    private var _sceneDesc: String!
    private var _dateShot: String!
    private var _imagePath: String!
    
    
    //MARK: Inits
    //this is here just to enable the required convenience init to call init()
    override init() {}
    
    //assign the incoming
    init(imagePath:String, title:String, sceneDesc:String, dateShot:String) {
        self._imagePath = imagePath
        self._title = title
        self._sceneDesc = sceneDesc
        self._dateShot = dateShot
    }
    
    //MARK: Encode / Decode
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
//        self._imagePath = aDecoder.decodeObjectForKey("imagePath") as? String
//        self._title = aDecoder.decodeObjectForKey("title") as? String
//        self._postDesc = aDecoder.decodeObjectForKey("postDesc") as? String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
//        aCoder.encodeObject(self._imagePath, forKey: "imagePath")
//        aCoder.encodeObject(self._title, forKey: "title")
//        aCoder.encodeObject(self._postDesc, forKey: "postDesc")
    }

    
    
    //MARK: public vars
    var imgPath : String {
        get {
            return _imagePath
        }
        set {
            _imagePath = newValue
        }
    }
    
    var title : String {
        get {
            return _title
        }
        
        set {
            _title = newValue
        }
    }
    
    var sceneDesc : String {
        get {
            return _sceneDesc
        }
        
        set {
            _sceneDesc = newValue
        }
    }
    
    var dateShot : String {
        get {
            return _dateShot
        }
        
        set {
            _dateShot = newValue
        }
    }
    
}