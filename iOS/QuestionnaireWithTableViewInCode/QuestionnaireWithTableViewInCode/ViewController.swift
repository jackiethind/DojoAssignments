//
//  ViewController.swift
//  QuestionnaireWithTableViewInCode
//
//  Created by Jackie Thind on 3/28/17.
//  Copyright © 2017 Jackie Thind. All rights reserved.
//

import UIKit

struct Question {
    var questionString: String?
    var answers: [String]?
    var selectedAnswerIndex: Int?
}

var questionsList: [Question] = [Question(questionString: "What is your favorite type of food?", answers: ["Pie","Chickens","Food? Give me some wine!"], selectedAnswerIndex:nil), Question(questionString: "What is your profession?", answers: ["Blacksmith","Brother of the Knight's Watch","King of the Andals"] , selectedAnswerIndex:nil), Question(questionString: "Do you believe in the Lord of Light?", answers: ["Yes","No"], selectedAnswerIndex:nil)]



class QuestionController: UITableViewController {
    let cellId = "cellId"
    let headerId = "headerId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Question"
        
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        
        
        tableView.register(AnswerCell.self, forCellReuseIdentifier: cellId)
        tableView.register(QuestionHeader.self, forHeaderFooterViewReuseIdentifier: headerId)
        // Do any additional setup after loading the view, typically from a nib.
        tableView.sectionHeaderHeight = 50
        // get rid of horizontal table view bars
        tableView.tableFooterView = UIView()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let index = navigationController?.viewControllers.index(of: self) {
            let question = questionsList[index]
            if let count = question.answers?.count {
                return count
            }
        }
        return 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! AnswerCell
        
        if let index = navigationController?.viewControllers.index(of: self) {
            let question = questionsList[index]
            cell.nameLabel.text = question.answers?[indexPath.row]
            
        }
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header =  tableView.dequeueReusableHeaderFooterView(withIdentifier: headerId) as! QuestionHeader
        if let index = navigationController?.viewControllers.index(of: self) {
            let question = questionsList[index]
            header.nameLabel.text = question.questionString

        }
        
        
        return header
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let index = navigationController?.viewControllers.index(of: self) {
            questionsList[index].selectedAnswerIndex = indexPath.item
            
            if index < questionsList.count - 1 {
                let questionController = QuestionController()
                navigationController?.pushViewController(questionController, animated: true)
                
            }
            else {
                let controller = ResultsController()
                navigationController?.pushViewController(controller, animated: true)
            }
        }
    }
}
class ResultsController: UIViewController {
    
    let resultsLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Congratulations, you're a wizard"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: "done")
        navigationItem.title = "Results"
        
        view.backgroundColor = UIColor.white
        view.addSubview(resultsLabel)
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : resultsLabel]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : resultsLabel]))
        
        let names = ["Wizard","Knight","Princess"]
        
        var score = 0
        for question in questionsList {
            score += question.selectedAnswerIndex!
        }
        
        let result = names[score % names.count]
        resultsLabel.text = "Congratulations, you're a \(result)"
    }
    func done() {
        navigationController?.popToRootViewController(animated: true)
    }
}



class QuestionHeader: UITableViewHeaderFooterView {
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Sample Question"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    func setupViews() {
        addSubview(nameLabel)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class AnswerCell: UITableViewCell {
    override init(style:UITableViewCellStyle, reuseIdentifier:String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Sample Answer"
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    func setupViews() {
        addSubview(nameLabel)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
        
    }
}












