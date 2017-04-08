//
//  ContactListTableViewController.swift
//  ActionSheetDemo
//
//  Created by Jackie Thind on 3/24/17.
//  Copyright © 2017 Jackie Thind. All rights reserved.
//

import UIKit
import CoreData

class ContactListTableViewController: UITableViewController, addContactViewControllerDelegate {
    var contacts = [Contact]()
    var alertController: UIAlertController!
    
    let manageObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loaded")
        fetchAllContacts()

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // listens for any time a row is clicked
        alertController = UIAlertController(title: "You can View, Edit or Delete", message: "Your Contacts", preferredStyle: UIAlertControllerStyle.actionSheet)
        let viewAction = UIAlertAction(title: "View", style: UIAlertActionStyle.default) { (action) in
            // send the file via email
            print("view contact ")
            self.performSegue(withIdentifier: "viewSegue", sender: indexPath)
        }
        let editAction = UIAlertAction(title: "Edit", style: UIAlertActionStyle.default) { (action) in
            // send the file via imessage
            print("edit contact")
            self.performSegue(withIdentifier: "editSegue", sender: indexPath)
            
        }
        let deleteAction = UIAlertAction(title: "Delete", style: UIAlertActionStyle.default) { (action) in
            // send the file via imessage
            print("delete contact")
            // lets grab the item in the row that was selected for deletion
            let contact = self.contacts[indexPath.row]
            // we need to remove from our database before we remove them from our array
            self.manageObjectContext.delete(contact)
            // WE NEED TO NOW SAVE, this throws so wrap it in a do and try, catch them errors yo
            self.saveData()
            // removes the item when delete is clicked after the swipe
            self.contacts.remove(at: indexPath.row)
            tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (action) in
            // cancels out
            print("was cancelled")
        }
        
        alertController.addAction(viewAction)
        alertController.addAction(editAction)
        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)

        self.present(alertController, animated: true, completion: nil)
        print("Selected")
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
        cell.textLabel?.text = "\(contacts[indexPath.row].firstName!) \(contacts[indexPath.row].lastName!)"
//        cell.phoneDetail.setTitle("\(contacts[indexPath.row].phone!)", for: .normal)
        cell.detailTextLabel?.textColor = UIColor.blue
        cell.detailTextLabel?.text = "\(contacts[indexPath.row].phone!)"

        // return cell so that Table View knows what to draw in each row
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contacts.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addNewContactSegue" {
            let navigationController = segue.destination as! UINavigationController
            let addContactViewController = navigationController.topViewController as! AddContactViewController
            addContactViewController.delegate = self
        }
            
        else if segue.identifier == "editSegue" {
            
            let navigationController = segue.destination as! UINavigationController
            let addContactViewController = navigationController.topViewController as! AddContactViewController
            addContactViewController.delegate = self
            print("*****************got to edit segue")
            let indexPath = sender as! NSIndexPath
            let editingContact = contacts[indexPath.row]
            addContactViewController.firstName = editingContact.firstName!
            addContactViewController.lastName = editingContact.lastName!
            addContactViewController.phone = editingContact.phone!
            addContactViewController.indexPath = indexPath
            addContactViewController.title = "Edit Contact"

        }
        else if segue.identifier == "viewSegue" {
            let navigationController = segue.destination as! UINavigationController
            let displayViewController = navigationController.topViewController as! displayViewController
            displayViewController.delegate = self
            let indexPath = sender as! NSIndexPath
             print("*****************got to view segue")
            let viewingContact = contacts[indexPath.row]
            displayViewController.firstName = viewingContact.firstName!
            displayViewController.lastName = viewingContact.lastName!
            displayViewController.phone = viewingContact.phone!
            displayViewController.indexPath = indexPath
            displayViewController.title = "\(viewingContact.firstName!)"
            
        }
    }
    // DELEGATE METHODS
     // make sure the controllers are the same here and on the delegate protocol file
    func contactSaved(by controller: AddContactViewController, with firstName: String, lastName: String, phone: String, at indexPath: NSIndexPath?) {
        print("\(firstName) \(lastName) \(phone) \(indexPath)")
        if let ip = indexPath {
            print("*****************got to edit process")
            let contact = contacts[ip.row]
            contact.firstName = firstName
            contact.lastName = lastName
            contact.phone = phone
        }
        
        else {
            let UserContact = NSEntityDescription.insertNewObject(forEntityName: "Contact", into: manageObjectContext) as! Contact // make sure you cast the entity item as a contact
            // then set the text of that item by overriding
            UserContact.firstName = firstName
            UserContact.lastName = lastName
            UserContact.phone = phone
            
            contacts.append(UserContact)
        }
        
        tableView.reloadData()
        print("I'm the hidden controller, BUT I am responding to the save button press on the top view controller")
        // dismisses the view
        saveData()
        dismiss(animated: true, completion: nil)
        // WE NEED TO NOW SAVE, this throws so wrap it in a do and try, catch them errors yo
       
    }

    func cancelButtonPressed(by controller: AddContactViewController) {
        // required by ContactListTableViewControllerDelegate protocol
        print("I'm the hidden controller, BUT I am responding to the cancel button press on the top view controller")
        // dismisses the view
        dismiss(animated: true, completion: nil)
    }
    func doneButtonPressed(by controller: displayViewController) {
         print("I'm the hidden controller, BUT I am responding to the done button press on the top view controller")
        dismiss(animated: true, completion: nil)
    }
    // CORE DATA
    func fetchAllContacts() {
        // we need to first create a request, entity name is the name of the "table"
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Contact")
        
        do {
            // the fetch method throws, to prevent this you need to wrap in a do and then try it
            // while making sure to catch any errors that might occur
            let result = try manageObjectContext.fetch(request)
            contacts = result as! [Contact]
        }
        catch {
            print(error)
        }
    }
    func saveData() {
        // WE NEED TO NOW SAVE, this throws so wrap it in a do and try, catch them errors yo
        do {
            try manageObjectContext.save()
        }
        catch {
            print("\(error)")
        }
    }
}


