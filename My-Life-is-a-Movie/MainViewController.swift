//
//  ViewController.swift
//  My-Life-is-a-Movie
//
//  Created by Anthony Torrero Collins on 2/15/16.
//  Copyright © 2016 Anthony Torrero Collins. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tvMyScenes: UITableView!
    
    var scenes = [Scene]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //camel pattern image
        let myNavColor = UIColor.init(patternImage: UIImage(named: "CamelPattern")!)
        self.navigationController!.navigationBar.barTintColor = myNavColor
        self.navigationController!.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Helvetica Neue", size: 22)!]

        //set up table view
        tvMyScenes.layer.cornerRadius = CGFloat(5.0)
        tvMyScenes.clipsToBounds = true
        
        //delegation
        self.tvMyScenes.delegate = self
        self.tvMyScenes.dataSource = self
    }

    override func viewDidAppear(animated: Bool) {
        fetchAndSetResults()
        tvMyScenes.reloadData()
    }
    
    //MARK: Utility
    //pull from core data
    func fetchAndSetResults() {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Scene")
        
        do {
            let results =  try context.executeFetchRequest(fetchRequest)
            self.scenes = results as! [Scene]
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }

    
    //MARK: Required Table View code
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return CGFloat(100.0)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scenes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("SceneCell") as? SceneCell {
            
            let scene = scenes[indexPath.row]
            cell.configureCell(scene)
            return cell
        } else {
            //TODO: configure the blank cell, or throw an exception.
            return SceneCell()
        }
    }
    
    //MARK: Added features
   // func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
   //     var i: Int = 2
        
   // }
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SceneDetails" {
            let destinationController = segue.destinationViewController as! SceneDetailsVC
            let indexPath = tvMyScenes.indexPathForSelectedRow!
            let scene = scenes[indexPath.row]
            destinationController.sceneOfInterest = scene
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

    
}

