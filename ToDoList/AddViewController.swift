//
//  AddViewController.swift
//  ToDoList
//
//  Created by kelly on 2014/10/14.
//  Copyright (c) 2014年 kelly. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField! = UITextField ()
    @IBOutlet weak var notesTextView: UITextView! = UITextView ()
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButtonTapped(sender: AnyObject) {
        var userDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()

        var itemList:NSMutableArray? = userDefaults.objectForKey("itemList") as? NSMutableArray
        
        var dataSet: NSMutableDictionary = NSMutableDictionary ()
        dataSet.setObject(titleTextField.text, forKey: "itemTitel")
        dataSet.setObject(notesTextView.text, forKey: "itemNote")
        
        if (itemList != nil){ // data already available
            var newMutableList :NSMutableArray = NSMutableArray ()
            
            for dict: AnyObject in itemList! {
                newMutableList.addObject(dict as NSDictionary)
            }
            
            userDefaults.removeObjectForKey("itemList")
            newMutableList.addObject(dataSet)
            userDefaults.setObject(newMutableList, forKey: "itemList")
            
        } else { // this is the first todo item in the list
            userDefaults.removeObjectForKey("itemList")
            itemList = NSMutableArray()
            itemList!.addObject(dataSet)
            userDefaults.setObject(itemList, forKey: "itemList")
        }
        
        userDefaults.synchronize()
        
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
