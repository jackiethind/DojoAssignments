//
//  ViewController.swift
//  Star Wars Encyclopedia
//
//  Created by Jackie Thind on 3/22/17.
//  Copyright © 2017 Jackie Thind. All rights reserved.
//

import UIKit

class PeopleViewController: UITableViewController {
    var people = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // specify the url that we will be sending the GET request to
        let url = URL(string: "http://swapi.co/api/people")
        // create a URLSession to handle the request tasks
        let session = URLSession.shared
        // create a "data task" to make the request and run the completion handler
        let task = session.dataTask(with: url!, completionHandler: {
            // see: Swift closure expression syntax
            data, response, error in
            // data -> JSON data, response -> headers and other meta-information, error -> if one occured
            // do-try-catch blocks execute a try statement and then use the catch statement for errors
            do {
                // try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    // Why do we need to optionally unwrap jsonResult["results"]
                    // try it without the optional unwrapping and you'll see that the value is actually an optional 
                    if let results = jsonResult["results"] {
                        // coercing the results object as an NSArray and then storing in that resultsArray
                        let resultsArray = results as! NSArray
                        // now we can run NSArray methods like count and firstObject
//                        print(resultsArray.count)
//                        print(resultsArray[0])
                        for i in 0..<resultsArray.count {
                            let newDict = resultsArray.object(at: i) as! NSDictionary
                            self.people.append(newDict.value(forKey: "name") as! String)
                            print (self.people)
                            self.tableView.reloadData()
                        }
                    }
                    
                }
            }
            catch {
                print(error)
            }

        })
        // execute the task and then wait for the response 
        // to run the completion handlder. This is a async!
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create a generic cell
        let cell = UITableViewCell()
        // set the default cell label to the corresponding element in the people array
        cell.textLabel?.text = people[indexPath.row]
        // return the cell so that it can be rendered
        return cell
    }
}

