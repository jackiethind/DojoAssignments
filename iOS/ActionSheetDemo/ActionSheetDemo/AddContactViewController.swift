//
//  AddContactViewController.swift
//  ActionSheetDemo
//
//  Created by Jackie Thind on 3/24/17.
//  Copyright © 2017 Jackie Thind. All rights reserved.
//

import UIKit

class AddContactViewController: UIViewController {
    
    // this creates the connection to the delegate through a REFERENCE, its asking who its delegate is going to be and leaves that to be answered by us in the previous controller class, which is the bucketlistviewcontroller class
    
    // 1
    weak var delegate: addContactViewControllerDelegate?
    
    // create a reference in order to prepopulate the name
    var firstName: String?
    var lastName: String?
    var phone: String?
    // create a reference for the indexpath of the row selected
    var indexPath: NSIndexPath?
    
    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var errorsLabel: UILabel!
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        delegate?.cancelButtonPressed(by: self)
        print("cancel")
    }
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
    
        let firstName = firstNameField.text!
        let lastName = lastNameField.text!
        let phone = phoneField.text!
//        if firstName == "" {
//            errorsLabel.text = "Please Do Not Leave First Name Blank"
//            errorsLabel.isHidden = false
//        }
//        else if lastName == "" {
//            errorsLabel.text = "Please Do Not Leave Last Name Blank"
//            errorsLabel.isHidden = false
//        }
//        else if phone == "" {
//            errorsLabel.text = "Please Do Not Leave Number Blank"
//            errorsLabel.isHidden = false
//        }
        
        let firstNameValidation = validateFirstName(str: firstName)
        let lastNameValidation = validateFirstName(str: lastName)
        let phoneNumberValidator = phone.isPhoneNumber
        if firstNameValidation == false {
            errorsLabel.text = "Please enter a valid first name"
            errorsLabel.isHidden = false
        }
        else if lastNameValidation == false {
            errorsLabel.text = "Please enter a valid last name"
            errorsLabel.isHidden = false
        }
        else if phoneNumberValidator == false {
            errorsLabel.text = "Please enter a valid number"
            errorsLabel.isHidden = false
        }
        else {
            delegate?.contactSaved(by: self, with: firstName, lastName: lastName, phone: phone, at: indexPath)
            print("saved")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameField.text = firstName
        lastNameField.text = lastName
        phoneField.text = phone
    }
    func validateFirstName(str: String) -> Bool
    {
        do
        {
            let regex = try NSRegularExpression(pattern: "^[a-zA-Z\\_]{2,18}$", options: .caseInsensitive)
            if regex.matches(in: str, options: [], range: NSMakeRange(0, str.characters.count)).count > 0 {return true}
        }
        catch {}
        return false
    }
}
extension String {
    var isPhoneNumber: Bool {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: self, options: [], range: NSMakeRange(0, self.characters.count))
            if let res = matches.first {
                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.characters.count
            } else {
                return false
            }
        } catch {
            return false
        }
    }
}
