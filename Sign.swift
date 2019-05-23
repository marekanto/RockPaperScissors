//
//  Sign.swift
//  RPS
//
//  Created by User on 04.01.2019.
//  Copyright © 2019 Marek_Antoszewski. All rights reserved.
//

import Foundation
import GameKit
let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)
func randomSign() -> Sign{
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    }else if sign == 1{
        return .paper
    }else {
        return .scissors
    }
}
enum Sign{
    case rock, paper, scissors
    var emoji: String {
        switch self{
    case .rock: return "✊"
    case .paper: return "✋"
    case .scissors: return "✌️"
        }
    }
        func compareTo(_ otherSign:Sign)->GameState{
            if otherSign == .rock{
                switch self{
                case .rock: return GameState.draw
                case .scissors: return GameState.lose
                case .paper: return GameState.win
                }
                }
            if otherSign == .paper{
                switch self{
                case .rock: return GameState.lose
                case .scissors: return GameState.win
                case .paper: return GameState.draw
                }
                }
            if otherSign == .scissors{
                switch self{
                case .rock: return GameState.win
                case .scissors: return GameState.draw
                case .paper: return GameState.lose
                }
            }
            return GameState.start
    }
    
    
                
}



