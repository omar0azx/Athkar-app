//
//  CollectionViewCell.swift
//  الاذكار
//
//  Created by omar alzhrani on 26/02/1443 AH.
//

import UIKit

class CollectionViewCell: UICollectionViewCell, UICollectionViewDelegate {
    
    
    @IBOutlet weak var dhikerLabel: UILabel!
    @IBOutlet weak var counterOfDhiker: UILabel!
    
    
    func confg(text: String , counter: Int) {
        self.dhikerLabel.text = text
        counterOfDhiker.text = String(counter)
        
    }
    
}
