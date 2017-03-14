//
//  ViewController.swift
//  TTT
//
//  Created by Jackie Thind on 3/8/17.
//  Copyright © 2017 Jackie Thind. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var blockOne: UIButton!
    @IBOutlet weak var blockTwo: UIButton!
    @IBOutlet weak var blockThree: UIButton!
    @IBOutlet weak var blockFour: UIButton!
    @IBOutlet weak var blockFive: UIButton!
    @IBOutlet weak var blockSix: UIButton!
    @IBOutlet weak var blockSeven: UIButton!
    @IBOutlet weak var blockEight: UIButton!
    @IBOutlet weak var blockNine: UIButton!
    @IBOutlet weak var winLabel: UILabel!
    
    var activePlayer = 1 // red
    var gameState = [0,0,0,0,0,0,0,0,0]
    var redPlayer: [Int] = []
    var bluePlayer: [Int] = []
    
    let winningCombinations = [[1,2,3], [4,5,6], [7,8,9], [3,6,9], [2,5,8], [1,4,7], [7,5,3], [1,5,9]]
//    let winningCombo1 = [1,2,3]
//    let winningCombo2 = [4,5,6]
//    let winningCombo3 = [7,8,9]
//    let winningCombo4 = [3,6,9]
//    let winningCombo5 = [2,5,8]
//    let winningCombo6 = [1,4,7]
//    let winningCombo7 = [7,5,3]
//    let winningCombo8 = [1,5,9]
//    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if gameState[sender.tag-1] == 0 {
            gameState[sender.tag-1] = activePlayer
            if (activePlayer == 1) {
                sender.backgroundColor = UIColor.red
                redPlayer.append(sender.tag)
                print("Red player chose \(redPlayer)")
                activePlayer = 2
            }
            else {
                sender.backgroundColor = UIColor.blue
                bluePlayer.append(sender.tag)
                print("Blue player chose \(bluePlayer)")
                activePlayer = 1
            }
        }
        
        print(winningCombinations[0][0])
        
    }
    
    
    @IBAction func resetButton(_ sender: UIButton) {
        blockOne.backgroundColor = UIColor.gray
        blockTwo.backgroundColor = UIColor.gray
        blockThree.backgroundColor = UIColor.gray
        blockFour.backgroundColor = UIColor.gray
        blockFive.backgroundColor = UIColor.gray
        blockSix.backgroundColor = UIColor.gray
        blockSeven.backgroundColor = UIColor.gray
        blockEight.backgroundColor = UIColor.gray
        blockNine.backgroundColor = UIColor.gray
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

