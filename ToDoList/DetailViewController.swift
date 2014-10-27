//
//  DetailViewController.swift
//  ToDoList
//
//  Created by kelly on 2014/10/14.
//  Copyright (c) 2014年 kelly. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleTextfield: UITextField! = UITextField ()
    @IBOutlet weak var notesTextView: UITextView! = UITextView ()
    
    var toDoData:NSDictionary = NSDictionary ()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleTextfield.userInteractionEnabled = false
        notesTextView.userInteractionEnabled = false
        
        titleTextfield.text = toDoData.objectForKey("itemTitel") as String
        notesTextView.text = toDoData.objectForKey("itemNote") as String
        
    }

    @IBAction func deleteItem(sender: AnyObject) {
        
        var userDefaults:NSUserDefaults = NSUserDefaults ()
        
        var itemListArray:NSMutableArray = userDefaults.objectForKey("itemList") as NSMutableArray
        
        var mutableItemList:NSMutableArray = NSMutableArray ()
        
        for dict:AnyObject in itemListArray {
            mutableItemList.addObject(dict as NSDictionary)
        }
        
        mutableItemList.removeObject(toDoData)
        
        userDefaults.removeObjectForKey("itemList")
        userDefaults.setObject(mutableItemList, forKey: "itemList")
        userDefaults.synchronize()
        
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
