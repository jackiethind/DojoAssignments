//
//  ViewController.swift
//  Ninja Gold
//
//  Created by Jackie Thind on 3/7/17.
//  Copyright © 2017 Jackie Thind. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var farmLabel: UILabel!
    @IBOutlet weak var caveLabel: UILabel!
    @IBOutlet weak var houseLabel: UILabel!
    @IBOutlet weak var casinoLabel: UILabel!
    
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = String(score)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func buildingButtonPress(_ sender: UIButton) {
        if sender.tag == 1 {
            farmLabel.isHidden = false
            let gold = Int(arc4random_uniform(11) + 10)
            updateGold(amount: gold)
            farmLabel.text = "Won \(gold) from the farm"
            scoreLabel.text = String(score)
        }
        else if sender.tag == 2 {
            caveLabel.isHidden = false
            let gold = Int(arc4random_uniform(6) + 5)
            updateGold(amount:gold)
            caveLabel.text = "Won \(gold) from the cave!"
            scoreLabel.text = String(score)
        }
        else if sender.tag == 3 {
            houseLabel.isHidden = false
            let gold = Int(arc4random_uniform(4) + 2)
            updateGold(amount:gold)
            houseLabel.text = "Won \(gold) from the house!"
            scoreLabel.text = String(score)
        }
        else if sender.tag == 4 {
            houseLabel.isHidden = false
            let gold = Int(arc4random_uniform(51))
            let rando = Int(arc4random_uniform(2))
            if rando == 1 {
                updateGold(amount: gold)
                casinoLabel.text = "Won \(gold) from the casino!"
                scoreLabel.text = String(score)
            }
            else {
                score -= gold
                casinoLabel.text = "Lost \(gold) from the casino!"
                scoreLabel.text = String(score)
            }
            updateGold(amount:gold)
            
        }
        
        else if sender.tag == 5 {
            resetGame()
        }
        
        print(sender.tag)
    }
   


    func updateGold(amount:Int) {
        print("We updated Gold!")
        score += amount
    }
    func resetGame() {
        farmLabel.isHidden = true
        houseLabel.isHidden = true
        caveLabel.isHidden = true
        casinoLabel.isHidden = true
        score = 0
        scoreLabel.text = String(score)
        
    }
}

