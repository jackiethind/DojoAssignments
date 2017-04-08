//
//  addButtonDelegate.swift
//  ToDoList
//
//  Created by Jackie Thind on 3/21/17.
//  Copyright © 2017 Jackie Thind. All rights reserved.
//

import Foundation
import UIKit

protocol addButtonDelegate: class {
    func addButtonPressed(by controller: addItemViewController, with item: String, description: String, date: Date, checked: Bool)
    
}
