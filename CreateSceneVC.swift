//
//  CreateSceneVC.swift
//  My-Life-is-a-Movie
//
//  Created by Anthony Torrero Collins on 2/18/16.
//  Copyright © 2016 Anthony Torrero Collins. All rights reserved.
//

import UIKit
import CoreData


/* 
    CreateScene is the first step in a new episode record. Once added, it moves to
    AddMovieToScene.

    Note the image picker requires both delegate protocols
*/
class CreateSceneVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var sceneScroller: UIScrollView!
    @IBOutlet weak var txtSceneTitle: UITextField!
    @IBOutlet weak var txtSceneDesc: UITextView!
    @IBOutlet weak var txtSceneDate: UITextField!
    @IBOutlet weak var imgScenePhotoView: UIImageView!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //camel pattern image
        let myNavColor = UIColor.init(patternImage: UIImage(named: "CamelPattern")!)
        self.navigationController!.navigationBar.barTintColor = myNavColor
        self.navigationController!.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Helvetica Neue", size: 22)!]
        
        self.txtSceneDesc.layer.cornerRadius = 5.0
        self.txtSceneDesc.clipsToBounds = true
        
        self.imgScenePhotoView.layer.cornerRadius = 5.0
        self.imgScenePhotoView.clipsToBounds = true
        
        let contentWidth = self.sceneScroller.bounds.width
        let contentHeight = self.sceneScroller.bounds.height
        self.sceneScroller.contentSize = CGSizeMake(contentWidth, contentHeight)
        
        //image picker for photo and set delegate
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
    }

 
    
    // MARK: - Navigation
    

    //TODO: Change to select movie.
    @IBAction func btnSave_Press(sender: UIBarButtonItem) {
        
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let entity = NSEntityDescription.entityForName("Scene", inManagedObjectContext: context)!
        let addScene = Scene(entity: entity, insertIntoManagedObjectContext: context)

        addScene.sceneTitle = self.txtSceneTitle.text
        addScene.sceneDesc = self.txtSceneDesc.text
        addScene.dateShot = self.txtSceneDate.text
        addScene.setSceneImage(imgScenePhotoView.image!)

        context.insertObject(addScene)
        do {
            try context.save()
        } catch let err as NSError {
            print("nope")
            print(err.debugDescription)
            
        }
        
        self.navigationController?.popViewControllerAnimated(true)
        
        
    }
    
    /* 
        Get the photo
    */
    @IBAction func btnAddPhoto_Press(btn: UIButton) {
        
        //remove the 'add new' caption
        //TODO: first x chars of the image name?
        btn.setTitle("", forState: .Normal)
        
        //shell the image picker
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    
    @IBAction func txtDateOfScene(sender: UITextField) {
        
        let datePickerView: UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.DateAndTime
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: "datePickerViewChanged:", forControlEvents: .ValueChanged)
    }
    
    func datePickerViewChanged(sender:UIDatePicker) {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        
        //this uses global access to the text field, but the ref is
        // somewhere inside the datePickerView target. Can dig into that?
        txtSceneDate.text = dateFormatter.stringFromDate(sender.date)
    }
    
    /* 
        When the user selects an image, store it in the local variable.
    */
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        self.imgScenePhotoView.image = image
    }
}
