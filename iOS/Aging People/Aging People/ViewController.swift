//
//  ViewController.swift
//  Aging People
//
//  Created by Jackie Thind on 3/14/17.
//  Copyright © 2017 Jackie Thind. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var names = ["Jackie", "Justin", "Sam", "Patrick", "Joey", "Cristine", "White Jon", "Asian Jon", "Black Jon", "Olive", "Urian", "Pepper"]
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// Controller conforms to the UITableViewDataSource protocol:
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = self.names[indexPath.row]
        let age = arc4random_uniform(95-5) + 5
        cell.detailTextLabel?.text = "\(age) years old"
        return cell
    }
}

//extension ViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("Section: \(indexPath.section) and Row: \(indexPath.row)")
//        names.remove(at: indexPath.row)
//        tableView.reloadData()
//    }
//}
