//
//  SceneDetailsVC.swift
//  My-Life-is-a-Movie
//
//  Created by Anthony Torrero Collins on 2/18/16.
//  Copyright © 2016 Anthony Torrero Collins. All rights reserved.
//

import UIKit
import CoreData

/* 
    SceneDetails just shows a full record.
*/
class SceneDetailsVC: UIViewController {

    let HEIGHT_OFFSET = CGFloat(10)
    let FRAME_DOWNSHIFT = CGFloat(19)
    let WIDTH_OFFSET = CGFloat(32)
    
    var sceneOfInterest: Scene!
    

    @IBOutlet var baseView: UIView!
    @IBOutlet weak var sceneScroller: UIScrollView!
    @IBOutlet weak var sceneBack: UIView!
    @IBOutlet weak var sceneDate: UILabel!
    @IBOutlet weak var sceneDesc: UILabel!
    @IBOutlet weak var scenePhoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //camel pattern image
        let myNavColor = UIColor.init(patternImage: UIImage(named: "CamelPattern")!)
        self.navigationController!.navigationBar.barTintColor = myNavColor
        self.navigationController!.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Helvetica Neue", size: 22)!]
        
        self.navigationItem.title = sceneOfInterest.sceneTitle
        sceneDate.text = sceneOfInterest!.dateShot
        sceneDesc.text = sceneOfInterest!.sceneDesc
        scenePhoto.image = sceneOfInterest!.getSceneImage()
        
        scenePhoto.layer.cornerRadius = 5.0
        scenePhoto.clipsToBounds = true
        
        sceneBack.layer.cornerRadius = 5.0
        sceneBack.clipsToBounds = true
        
    }

    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        
        fixSizesOfComponents()

    }
    
    override func viewDidAppear(animated: Bool) {

        fixSizesOfComponents()
    }

    /*
        Because of the difference in size classes in landscape and portrait, 
        there is some adjustment to the scroll view and the scene background
        that has to be done programmatically. It's a tweak.
    
        Even with this, there is a 1x1-pixel shift toward the upper left on showing this 
        view.
        
        TODO: Resolve the margin differences
    
        Also, the margins of the main screen are wider than on this screen. 

        TODO: Resolve the shift
    */
    func fixSizesOfComponents() {
        let contentWidth = self.sceneScroller.bounds.width
        let contentHeightScroller = self.sceneScroller.bounds.height
        let contentHeightLabel = self.sceneDesc.bounds.height + HEIGHT_OFFSET
        let contentHeightPhoto = self.scenePhoto.bounds.height
        
        
        let contentHeightToUse: CGFloat = (contentHeightScroller > (contentHeightLabel+contentHeightPhoto + HEIGHT_OFFSET)) ? contentHeightScroller : contentHeightLabel+contentHeightPhoto + HEIGHT_OFFSET
        
        self.baseView.frame = CGRectMake(0, 0, contentWidth, contentHeightToUse)
        self.sceneBack.frame = CGRectMake(0, FRAME_DOWNSHIFT, contentWidth - WIDTH_OFFSET, contentHeightToUse)
        self.sceneScroller.contentSize = CGSizeMake(contentWidth, contentHeightToUse)
        
        self.sceneBack.center.x = self.baseView.center.x
    }

}
