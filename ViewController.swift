//
//  ViewController.swift
//  RPS
//
//  Created by User on 04.01.2019.
//  Copyright © 2019 Marek_Antoszewski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        stateOfGame(.start)
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var appSign: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var rockSign: UIButton!
    @IBOutlet weak var paperSign: UIButton!
    @IBOutlet weak var scissorsSign: UIButton!
    @IBOutlet weak var playAgain: UIButton!
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var winLabel: UILabel!
    var winCounter: Int = 0;
    var roundCounter: Int = 0;
    @IBAction func rockSign(_ sender: Any) {
         play(choosenSign: .rock)
    }
    @IBAction func paperSign(_ sender: Any) {
        play(choosenSign: .paper)
    }
    @IBAction func scissorsSign(_ sender: Any) {
        play(choosenSign: .scissors)
    }
    @IBAction func playAgain(_ sender: Any) {
        stateOfGame(.start)
    }
    func stateOfGame(_ whichIs:GameState){
        if whichIs == GameState.start {
        mainView.backgroundColor = UIColor.orange
        statusLabel.text = "Rock, paper, scissors?"
        playAgain.isHidden = true
        appSign.text = "🤖"
        paperSign.isEnabled = true
        rockSign.isEnabled = true
        scissorsSign.isEnabled = true
        paperSign.isHidden = false
        rockSign.isHidden = false
        scissorsSign.isHidden = false
        winLabel.isHidden = false
        winLabel.text = String(winCounter)
            roundCounter+=1
        roundLabel.text = String(roundCounter)
        }
        if whichIs == GameState.win{
        statusLabel.text = "You won!"
        winCounter+=1;
        appSign.text = "🏆"
        mainView.backgroundColor = UIColor.yellow
        playAgain.isHidden = false
        
        }
        if whichIs == GameState.lose{
        statusLabel.text = "You lost..."
        appSign.text = "😿"
        mainView.backgroundColor = UIColor.green
        playAgain.isHidden = false
        }
        if whichIs == GameState.draw{
        appSign.text = "🤝"
        statusLabel.text = "It's a draw!"
        mainView.backgroundColor = UIColor.blue
         playAgain.isHidden = false
        }
    }
    func play(choosenSign: Sign){
        let computerSign = randomSign()
    let currentState = choosenSign.compareTo(computerSign)
        stateOfGame(currentState)
        appSign.text = computerSign.emoji
        paperSign.isEnabled = false
        rockSign.isEnabled = false
        scissorsSign.isEnabled = false
        if choosenSign == .rock{
            paperSign.isHidden = true
            scissorsSign.isHidden = true
        }
        if choosenSign == .paper{
            rockSign.isHidden = true
            scissorsSign.isHidden = true
        }
        if choosenSign == .scissors{
            rockSign.isHidden = true
            paperSign.isHidden = true
        }
        playAgain.isHidden = false
    }
    



}

