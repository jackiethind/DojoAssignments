//
//  AddItemViewController.swift
//  bucket_demo
//
//  Created by Jackie Thind on 3/19/17.
//  Copyright © 2017 Jackie Thind. All rights reserved.
//

import Foundation
import UIKit

class AddItemViewController: UIViewController {
    
    @IBOutlet weak var userTextField: UITextField!
    // this will make sure that any class we put inside for self has to conform to CancelDelegate protocol
    // has to have a reference or access to go back to the page it came from 
    // with types, set optionals but make sure you set to self on the previous page
     // now both will be set to buckelisttableviewcontroller, because i set them before i got to this page
    var cancelDelegateVariable: CancelDelegate?
    var doneDelegateVariable: DoneDelegate?
    
    // we got to pass in the string of the edit selected item
    // once edit is presssed these variables will no longer be optional
    var indexOfItemToEdit: Int?
    var textOfItemToEdit: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let item = textOfItemToEdit {
            userTextField.text = item
            self.navigationItem.title = "Edit Item"
        }
    }
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        print("pressed cancel")
        // before the segue happened, i set the cancelDelegateVariable to self of this class additemviewcontroller, we want to dismiss this through the cancelbuttonpressed func which was created in the canceldelegate, the bucketlistviewcontroller conformed to that protocol and inherited that function which has the dismiss
        cancelDelegateVariable?.cancelButtonPressed(controller: self)
    }
    
    @IBAction func donePressed(_ sender: UIBarButtonItem) {
        let userInput = userTextField.text!
        
        if let index = indexOfItemToEdit {
            doneDelegateVariable?.doneButtonPressedWithEdit(controller: self, text: userInput, index: index)
        }
        else {
            doneDelegateVariable?.doneButtonPressed(controller: self, text: userInput)
        }
        print(userInput)
        print("done pressed")
    }
    

}
