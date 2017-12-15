//
//  PracticeViewController.swift
//  CardTrick
//
//  Created by Abdulaziz Ismail on 15/12/2017.
//  Copyright © 2017 Abdulaziz Ismail. All rights reserved.
//

import UIKit
import AudioToolbox

class PracticeViewController: UIViewController {
    
    var suit = "a"
    var cardNumber = 0
    var cardPickedName: String = "a"

    @IBOutlet weak var suitImage: UIImageView!
    @IBOutlet weak var cardImage: UIImageView!
    
    @IBOutlet weak var currentNumber: UILabel!
    @IBOutlet weak var secondNoticeLabel: UILabel!
    @IBOutlet weak var swipeFor: UILabel!
    @IBOutlet weak var doubleTapLabel: UILabel!
    @IBOutlet weak var longPressLabel: UILabel!
    @IBOutlet weak var orKeepSwipping: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reset()

        currentNumber.adjustsFontSizeToFitWidth = true
        secondNoticeLabel.adjustsFontSizeToFitWidth = true
        swipeFor.adjustsFontSizeToFitWidth = true
        longPressLabel.adjustsFontSizeToFitWidth = true
        orKeepSwipping.adjustsFontSizeToFitWidth = true
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeUp.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeDown.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.longPressed))
        self.view.addGestureRecognizer(longPressRecognizer)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.doubleTapped))
        tap.numberOfTapsRequired = 2
        view.addGestureRecognizer(tap)
    }

    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
                
                if suit == "a"{
                    suit = "heart"
                    suitImage.image = UIImage(named: "heart")
                }else {
                    cardNumber += 2
                }
                print(suit, cardNumber)
                
            case UISwipeGestureRecognizerDirection.down:
                AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
                print("Swiped down")
                if suit == "a"{
                    suit = "diamond"
                    suitImage.image = UIImage(named: "diamond")
                }else {
                    cardNumber += 5
                }
                
            case UISwipeGestureRecognizerDirection.left:
                AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
                print("Swiped left")
                if suit == "a"{
                    suit = "spade"
                    suitImage.image = UIImage(named: "spadeW")
                }else {
                    cardNumber += 10
                }
                
            case UISwipeGestureRecognizerDirection.up:
                AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
                print("Swiped up")
                if suit == "a"{
                    suit = "shamrock"
                    suitImage.image = UIImage(named: "clubsW")
                }else {
                    cardNumber += 1
                }
                
            default:
                break
            }
            
            currentNumber.text = "+ " + String(cardNumber) + " ="
            
            if (suit != "a"){
                swipeFor.text = "Swipe for a number"
                doubleTapLabel.isHidden = false
            }
            
            if (cardNumber != 0) {
                longPressLabel.isHidden = false
                orKeepSwipping.isHidden = false
                currentNumber.isHidden = false
            }
            
            if (cardNumber > 13) {
                currentNumber.textColor = UIColor.red
                cardImage.image = UIImage(named: "mainScreen")
                longPressLabel.textColor = UIColor.red
            }else {
                cardPickedName = suit + String(cardNumber)
                cardImage.image = UIImage(named: cardPickedName)
            }
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func longPressed(sender: UILongPressGestureRecognizer)
    {
        if suit != "a" && cardNumber < 14 && cardNumber > 0{
            
            if (sender.state == UIGestureRecognizerState.began) {
                print("Long press detected.")
                cardPickedName = suit + String(cardNumber)
                let cardPicked = UIImage(named: cardPickedName)
                print(cardPickedName)
                UIImageWriteToSavedPhotosAlbum(cardPicked!, nil, nil, nil);
                AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
                doneButton.isHidden = false
                againButton.isHidden = false
            }
            
        }

        
    }
    
    func doubleTapped() {
        reset()
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
    }
    
    func reset() {
        suit = "a"
        cardNumber = 0
        currentNumber.text = "+ " + String(cardNumber) + " ="
        currentNumber.textColor = UIColor.white
        cardImage.image = UIImage(named: "mainScreen")
        suitImage.image = UIImage(named: "mainScreen")
        swipeFor.text = "Swipe for a suit"
        doubleTapLabel.isHidden = true
        longPressLabel.isHidden = true
        currentNumber.isHidden = true
        doneButton.isHidden = true
        againButton.isHidden = true
        orKeepSwipping.isHidden = true
    }

    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var againButton: UIButton!
    
    @IBAction func doneDidTapped(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: "firstlaunch")
        UserDefaults.standard.synchronize();
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = storyboard.instantiateViewController(withIdentifier: "mainVC") as! UIViewController
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = mainVC
        
        
    }
    
    @IBAction func againDidTapped(_ sender: Any) {
        reset()
    }
    
}
