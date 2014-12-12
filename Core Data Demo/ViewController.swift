//
//  ViewController.swift
//  Core Data Demo
//
//  Created by ben on 11/12/2014.
//  Copyright (c) 2014 Ben Chamla. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var appDel:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        var context:NSManagedObjectContext = appDel.managedObjectContext!
        /*
        var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context) as NSManagedObject
        newUser.setValue("Jéjé", forKey: "username")
        newUser.setValue("pass7", forKey: "password")
        
        var error: NSError? = nil
        context.save(&error)
        */
        var request = NSFetchRequest(entityName: "Users")
        
        request.returnsObjectsAsFaults = false
        
        request.predicate = NSPredicate(format: "username= %@", "Arico")
        // to search in the database... do this :
        var results = context.executeFetchRequest(request, error: nil)
        
       
        if (results?.count > 0) {
            println(results)
            for result: AnyObject in results! {
                println(result.valueForKey("password")!)
            }
        }
        else{
            println("no users")
        }
        
        if (results?.count > 0) {
            for result:AnyObject in results! {
                if let user = result.valueForKey("username") as? String{
                    if user == "Arico" {
                        result.setValue("blablabla", forKey: "password")
                    }
                }
                context.save(nil)
            }
            
        }
        
       /* To delet item use this :
        if (results?.count > 0) {
            for result:AnyObject in results! {
                if let user = result.valueForKey("username") as? String{
                    if user == "Ben" {
                        context.deleteObject(result as NSManagedObject)
                    }
                }
                context.save(nil)
            }
            
        }*/
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

