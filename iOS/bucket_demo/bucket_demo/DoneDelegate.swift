//
//  DoneDelegate.swift
//  bucket_demo
//
//  Created by Jackie Thind on 3/19/17.
//  Copyright © 2017 Jackie Thind. All rights reserved.
//

import Foundation
import UIKit

protocol DoneDelegate: class {
    func doneButtonPressed(controller: UIViewController, text: String)
    func doneButtonPressedWithEdit(controller: UIViewController, text: String, index:Int)
}
