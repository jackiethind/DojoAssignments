//
//  CancelDelegate.swift
//  bucket_demo
//
//  Created by Jackie Thind on 3/19/17.
//  Copyright © 2017 Jackie Thind. All rights reserved.
//

import Foundation
import UIKit

protocol CancelDelegate:class {
    // anything that conforms to this, has to implement this function and pass this data to it whenever they use it, and whatever you do with that data is up to you 
    // (controller:UIViewController) means they will pass in their self. and once you get inside of this uiviewcontroller you can do whatever you like
    func cancelButtonPressed(controller:UIViewController)
}
