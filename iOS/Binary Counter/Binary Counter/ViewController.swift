//
//  ViewController.swift
//  Binary Counter
//
//  Created by Jackie Thind on 3/21/17.
//  Copyright © 2017 Jackie Thind. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    var total = 0
    @IBOutlet weak var totalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
//        totalLabel.text = "Total: \(total)"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("made it here")
        return 16
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BinaryCell", for: indexPath) as! BinaryTableViewCell
        cell.delegate = self
        print("hello \(indexPath.row)")
        cell.valueLabel.text = String(describing: pow(10, indexPath.row))
        return cell
    }
}

extension ViewController: BinaryTableViewCellDelegate {
    func valueChangedBy(value: Int) {
        self.total += value
        totalLabel.text = "Total: \(self.total)"
    }
}
