//
//  ViewController.swift
//  الاذكار
//
//  Created by omar alzhrani on 25/02/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var myView: UIView!
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var titleTime: UILabel!
    @IBOutlet weak var dateTime: UILabel!
    
    
    @IBOutlet weak var birds: UIImageView!
    @IBOutlet weak var stars: UIImageView!
    
    @IBOutlet weak var viewSunAndMoon: UIView!
    
    var dhikers = [Dhiker]()

    override func viewDidLoad() {
        super.viewDidLoad()

        temporary()
        dhikers = dhikerBank()
        
        if !time.text!.contains("P") {
            self.morningAndNightAnimation("Morning")
            self.morningAndNightAnimation("Night")
        } else {
            self.viewSunAndMoon.transform = CGAffineTransform.identity.rotated(by: 1.5)
            self.morningAndNightAnimation("Night")
            self.morningAndNightAnimation("Morning")
        }
        
        
        
   
    }
    
    
    func temporary() {
        
        let hijriCalendar = Calendar(identifier: .islamicCivil)
        let date = Date()
        let formatter = DateFormatter()
        let dateFormatter = DateFormatter()
            
        formatter.locale = Locale(identifier: "ar")
        formatter.calendar = hijriCalendar
            
        dateFormatter.dateFormat = "hh:MM a"
        let currentTime = dateFormatter.string(from: date)
        self.time.text = currentTime
            
        formatter.dateFormat = "EEE dd MMMM yyyy"
        let currentDate = formatter.string(from: date)
        self.dateTime.text = currentDate
    }

    func morningAndNightAnimation(_ style: String) {
        UIView.animate(withDuration: 2) {
            
            switch style {
            case "Morning":
                self.stars.alpha = 0
                self.myView.backgroundColor = #colorLiteral(red: 0.7947998643, green: 0.5775278211, blue: 0.3783648312, alpha: 1)
                self.titleTime.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                self.dateTime.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                self.time.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                self.viewSunAndMoon.transform = CGAffineTransform.identity.rotated(by: 0)
                self.birds.alpha = 1
                break
            case "Night":
                self.stars.alpha = 0.5
                self.myView.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
                self.titleTime.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                self.dateTime.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                self.time.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                self.viewSunAndMoon.transform = CGAffineTransform.identity.rotated(by: 1.5)
                self.birds.alpha = 0
                break
            default:
                break
            }
        }
    }
    
    
    
    
    func morning() {
        UIView.animate(withDuration: 2) {
        self.stars.alpha = 0
        self.myView.backgroundColor = #colorLiteral(red: 0.7947998643, green: 0.5775278211, blue: 0.3783648312, alpha: 1)
        self.titleTime.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.dateTime.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.time.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.viewSunAndMoon.transform = CGAffineTransform.identity.rotated(by: 6)
        self.birds.alpha = 1
        }
    }
    func night() {
        UIView.animate(withDuration: 2) {
        self.stars.alpha = 0.5
        self.myView.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        self.titleTime.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.dateTime.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.time.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.viewSunAndMoon.transform = CGAffineTransform.identity.rotated(by: 1.5)
        self.birds.alpha = 0
        }
    }
    
    func nightAndMorning(starAlpha: Double, bridsAlpha: Double, textColor: UIColor, backgroundColor: UIColor, deviation: Double) {
        UIView.animate(withDuration: 2) {
            self.stars.alpha = CGFloat(starAlpha)
            self.myView.backgroundColor = backgroundColor
            self.titleTime.textColor = textColor
            self.dateTime.textColor = textColor
            self.time.textColor = textColor
            self.viewSunAndMoon.transform = CGAffineTransform.identity.rotated(by: CGFloat(deviation))
            self.birds.alpha = CGFloat(bridsAlpha)
        }
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dhikers.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.confg(text: dhikers[indexPath.row].text, counter: dhikers[indexPath.row].numberOfRepetitions)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 400, height: 380)
    }
    
    func scrollToNextItem() {
        let contentOffset = CGFloat(floor(myCollectionView.contentOffset.x + myCollectionView.bounds.size.width))
        self.moveToFrame(contentOffset: contentOffset)
    }

    func moveToFrame(contentOffset : CGFloat) {
        myCollectionView.setContentOffset(CGPoint(x: contentOffset, y: myCollectionView.contentOffset.y), animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        scrollToNextItem()
    }

   
}


