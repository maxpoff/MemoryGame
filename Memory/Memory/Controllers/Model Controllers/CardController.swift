//
//  CardController.swift
//  Memory
//
//  Created by Maxwell Poffenbarger on 2/13/20.
//  Copyright © 2020 Maxwell Poffenbarger. All rights reserved.
//

import Foundation

class CardController {
    
    func getCards() -> [Card] {
        
        var generatedCardsArray = [Card]()
        
        for _ in 1...8 {
            
            let randomNumber = Int.random(in: 1...13)
            
            let cardOne = Card()
            cardOne.imageName = "card\(randomNumber)"
            generatedCardsArray.append(cardOne)
            
            let cardTwo = Card()
            cardTwo.imageName = "card\(randomNumber)"
            generatedCardsArray.append(cardTwo)
        }
        
        for i in 0...generatedCardsArray.count - 1 {
            let randomNumber = Int(arc4random_uniform(UInt32(generatedCardsArray.count)))
            
            let temporaryStorage = generatedCardsArray[i]
            generatedCardsArray[i] = generatedCardsArray[randomNumber]
            generatedCardsArray[randomNumber] = temporaryStorage
        }
        
        return generatedCardsArray
    }
}//End of class
