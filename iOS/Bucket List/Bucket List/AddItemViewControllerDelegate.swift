//
//  AddItemViewControllerDelegate.swift
//  Bucket List
//
//  Created by Jackie Thind on 3/14/17.
//  Copyright © 2017 Jackie Thind. All rights reserved.
//

import Foundation
protocol AddItemTableViewControllerDelegate: class {
    func itemSaved(by controller:AddItemTableViewController, with text: String, at indexPath:NSIndexPath?)
    func cancelButtonPressed(by controller:AddItemTableViewController)
}
