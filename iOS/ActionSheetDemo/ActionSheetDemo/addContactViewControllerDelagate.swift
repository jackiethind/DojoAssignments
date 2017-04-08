//
//  addContactDelagate.swift
//  ActionSheetDemo
//
//  Created by Jackie Thind on 3/24/17.
//  Copyright © 2017 Jackie Thind. All rights reserved.
//

import UIKit
import Foundation

protocol addContactViewControllerDelegate: class {
    func contactSaved(by controller: AddContactViewController, with firstName: String, lastName: String, phone: String, at indexPath:NSIndexPath?)
    func cancelButtonPressed(by controller: AddContactViewController)
    func doneButtonPressed(by controller: displayViewController)
}
