//
//  ViewController.swift
//  bucket_demo
//
//  Created by Jackie Thind on 3/19/17.
//  Copyright © 2017 Jackie Thind. All rights reserved.
//

import UIKit

class BucketListTableViewController: UITableViewController, CancelDelegate, DoneDelegate{
    
    var list = ["get black belt", "finish ios"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // get the UITableViewCell and create/populate it with data then return it
        // we are going to give the prototype cell an identifier so we can deque the cell and gain access to it, DONT forget to unwrap it
        let cell = tableView.dequeueReusableCell(withIdentifier: "bucketCell")!
        // .textLabel?.text lets you edit the text inside the protoype cell that has been dequed.
         // index gives you the section that you are in, the row gives you the row in that section
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "editItem", sender: indexPath)
        print("row was \(indexPath.row)")
    }
    
    
    // we want to run a function before a segue happens, when i press a button we want to update that varible of self to this controller instead
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // go through seque and reach the UINavController
        let nav = segue.destination as! UINavigationController
        // now we need to access the view controller embedded inside of our uinavcontroller
        let controller = nav.topViewController as! AddItemViewController
        // we can now access the varible that we made optional, and now make it equal to self, which is referring to this bucketlistviewcontroller class
        controller.cancelDelegateVariable = self
        controller.doneDelegateVariable = self
        // for seperating the addItem and editItem segues
        
        // everytime the accessory button is pressed, put this under prepare for segue for every time an accessory button is clicked
        if segue.identifier == "editItem" {
            let indexPath = sender as! IndexPath
            print("in edit item")
            // controller here is the page we wanna go to
            controller.indexOfItemToEdit = indexPath.row
            controller.textOfItemToEdit = list[indexPath.row]
        }
        
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        print("delete item at index \(indexPath.row)")
        list.remove(at:indexPath.row)
        self.tableView.reloadData()
    }
    
    
    // protocol methods
    func cancelButtonPressed(controller: UIViewController) {
        // we want to dismiss when the cancel button is pressed
        dismiss(animated: true, completion: nil)
    }
    func doneButtonPressed(controller: UIViewController, text: String) {
        list.append(text)
        self.tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    func doneButtonPressedWithEdit(controller: UIViewController, text:String, index: Int) {
        list[index] = text
        self.tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
}





















