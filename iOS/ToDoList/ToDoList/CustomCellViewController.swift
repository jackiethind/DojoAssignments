//
//  CustomCellViewController.swift
//  ToDoList
//
//  Created by Jackie Thind on 3/21/17.
//  Copyright © 2017 Jackie Thind. All rights reserved.
//

import UIKit
import CoreData

class CustomCellsViewController: UITableViewController, addButtonDelegate {
    
    var items = [ItemEntries]()
    
    let manageObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
        cell.listNameLabel.text = "\(items[indexPath.row].item!)"
        cell.listDescriptionLabel.text = "\(items[indexPath.row].descriptionOfItem!)"
        cell.listDateLabel.text = "\(items[indexPath.row].date!)"
        let item = items[indexPath.row]
        if item.checked == true {
            cell.accessoryType = .checkmark
        }
        else {
            cell.accessoryType = .none
        }
        return cell
    }
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loaded")
        fetchAllItems()
    }
    
    // Selected for Check
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
            let item = items[indexPath.row]
            if item.checked == true {
                item.checked = false
            }
            else if item.checked == false {
                item.checked = true
            }
            if item.checked == true {
                cell.accessoryType = .checkmark
            }
            else {
                cell.accessoryType = .none
            }
                    }
        print("You selected a row")
        // WE NEED TO NOW SAVE, this throws so wrap it in a do and try, catch them errors yo
        do {
            try manageObjectContext.save()
            print("Check has been saved")
        }
        catch {
            print("\(error)")
        }
    }
    
    
    
    // swipe to delete items on the list
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        // lets grab the item in the row that was selected for deletion
        let item = items[indexPath.row]
        // we need to remove from our database before we remove them from our array
        manageObjectContext.delete(item)
        // WE NEED TO NOW SAVE, this throws so wrap it in a do and try, catch them errors yo
        do {
            try manageObjectContext.save()
        }
        catch {
            print("\(error)")
        }
        // removes the item when delete is clicked after the swipe
        items.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let addItemTableViewController = navigationController.topViewController as! addItemViewController
        addItemTableViewController.delegate = self
    }
    // Delegate Methods
    
    func addButtonPressed(by controller: addItemViewController, with item: String, description: String, date: Date, checked:Bool) {
        print("\(item) \(description) \(date)")
        let UserItem = NSEntityDescription.insertNewObject(forEntityName: "ItemEntries", into: manageObjectContext) as! ItemEntries // make sure you cast the entity item as a bucketlistitem
        // then set the text of that item by overriding
        UserItem.item = item
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "MM/dd/yyyy"
        UserItem.date = dateFormatterGet.string(from: date)
        UserItem.descriptionOfItem = description
        UserItem.checked = false
        
        // append a new item
        items.append(UserItem)
        
        tableView.reloadData()
        
      
        // required by AddItemTableViewControllerDelegate protocol
        print("I'm the hidden controller, BUT I am responding to the add button press on the top view controller")
        // dismisses the view
        dismiss(animated: true, completion: nil)
        // WE NEED TO NOW SAVE, this throws so wrap it in a do and try, catch them errors yo
        do {
            try manageObjectContext.save()
        }
        catch {
            print("\(error)")
        }
    }
    
    // CoreDate
    
    func fetchAllItems() {
        // we need to first create a request, entity name is the name of the "table"
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ItemEntries")
        
        do {
            // the fetch method throws, to prevent this you need to wrap in a do and then try it
            // while making sure to catch any errors that might occur
            let result = try manageObjectContext.fetch(request)
            items = result as! [ItemEntries]
        }
        catch {
            print(error)
        }
    }
}
    

