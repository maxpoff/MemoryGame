//
//  CardCollectionViewCell.swift
//  Memory
//
//  Created by Nicholas Boleky on 2/13/20.
//  Copyright © 2020 Maxwell Poffenbarger. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var cardFrontImage: UIImageView!
    @IBOutlet weak var cardBackImage: UIImageView!
    
    //MARK: - Properties
    var card: Card?
    
    //MARK: - Class Methods
    func setCard(_ card: Card) {
        
        self.card = card
        
        if card.isMatched == true {
            cardBackImage.alpha = 0
            cardFrontImage.alpha = 0
            
            return
        } else {
            cardBackImage.alpha = 1
            cardFrontImage.alpha = 1
        }
        
        cardFrontImage.image = UIImage(named: card.imageName)
        
        if card.isFlipped == true {
            UIView.transition(from: cardBackImage, to: cardFrontImage, duration: 0, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        } else {
            UIView.transition(from: cardFrontImage, to: cardBackImage, duration: 0, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        }
    }
    
    func flipCardFront() {
        UIView.transition(from: cardBackImage, to: cardFrontImage, duration: 0.5, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
    }
    
    func flipCardBack() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            UIView.transition(from: self.cardFrontImage, to: self.cardBackImage, duration: 0.5, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
        }
    }
    
    func removeMatchedCards() {
        cardBackImage.alpha = 0
        
        UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {self.cardFrontImage.alpha = 0}, completion: nil)
    }
}
