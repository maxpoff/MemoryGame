//
//  CardViewController.swift
//  Memory
//
//  Created by Nicholas Boleky on 2/13/20.
//  Copyright © 2020 Maxwell Poffenbarger. All rights reserved.
//

import UIKit

class CardViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var cardCollectionView: UICollectionView!
    
    var card = CardController()
    var cards = [Card]()
    var firstSelectedCardIndex: IndexPath?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardCollectionView.delegate = self
        cardCollectionView.dataSource = self
        cards = card.getCards()
        
    }
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath) as! CardCollectionViewCell
        
        let card = cards[indexPath.row]
        cell.setCard(card)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
        
        let card = cards[indexPath.row]
        if card.isFlipped == false && card.isMatched == false {
            cell.flipCardFront()
            card.isFlipped = true
            
            if firstSelectedCardIndex == nil {
            firstSelectedCardIndex = indexPath
            } else {
            checkForMatches(indexPath)
                
                
        }
        
        
    }
    

}
    func checkForMatches(_ secondSelectedCardIndex: IndexPath) {
        let cardOneCell = cardCollectionView.cellForItem(at: firstSelectedCardIndex!) as? CardCollectionViewCell
        
        let cardTwoCell = cardCollectionView.cellForItem(at: secondSelectedCardIndex) as? CardCollectionViewCell
        
        
        let cardOne = cards[firstSelectedCardIndex!.row]
        let cardTwo = cards[secondSelectedCardIndex.row]
        
        if cardOne.imageName == cardTwo.imageName {
            cardOne.isMatched = true
            cardTwo.isMatched = true
            
            cardOneCell?.removeMatchedCards()
            cardTwoCell?.removeMatchedCards()
            
            checkGameOver()
            
        } else {
            cardOne.isFlipped = false
            cardTwo.isFlipped = false
            
            cardOneCell?.flipCardBack()
            cardTwoCell?.flipCardBack()
        }
        if cardOneCell == nil {
            cardCollectionView.reloadItems(at: [firstSelectedCardIndex!])
        }
        firstSelectedCardIndex = nil
    }
    
    func checkGameOver() {
        var isOver = true
        
        for card in cards {
            if card.isMatched == false {
                isOver = false
                break
            }
        }
        if isOver == true {
            //game is over
        } else {
            
        }
    }
    
    
}//end of class

