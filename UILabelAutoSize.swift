//
//  UILabelAutoSize.swift
//  My-Life-is-a-Movie
//
//  Created by Anthony Torrero Collins on 2/24/16.
//  Copyright © 2016 Anthony Torrero Collins. All rights reserved.
//

import UIKit

/*
    Added this label class to handle sizing and positioning issues 
    with the dsecription label on rotation in the Scene Details VC.

    Make sure the label numberOfLines to 0 in XCode

*/
class UILabelAutoSize: UILabel {

    override func layoutSubviews() {
        // 1. Get the label to set its frame correctly:
        super.layoutSubviews()
        
        // 2. Now the frame is set we can get the correct width
        // and set it to the preferredMaxLayoutWidth.
        self.preferredMaxLayoutWidth = self.frame.width
    }

}
