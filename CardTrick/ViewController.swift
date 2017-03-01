//
//  ViewController.swift
//  CardTrick
//
//  Created by Abdulaziz Ismail on 01/03/2017.
//  Copyright © 2017 Abdulaziz Ismail. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var suit = "a"
    var cardNumber = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        
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
    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                print(suit, cardNumber)
                if suit == "a"{
                    suit = "shamrock"
                }else {
                    cardNumber += 2
                }
                
            case UISwipeGestureRecognizerDirection.down:
                print("Swiped down")
                if suit == "a"{
                    suit = "diamond"
                }else {
                    cardNumber += 5
                }
                
            case UISwipeGestureRecognizerDirection.left:
                print("Swiped left")
                if suit == "a"{
                    suit = "spade"
                }else {
                    cardNumber += 10
                }
           
            case UISwipeGestureRecognizerDirection.up:
                print("Swiped up")
                if suit == "a"{
                    suit = "heart"
                }else {
                    cardNumber += 1
                }
             //   UIImageWriteToSavedPhotosAlbum(#imageLiteral(resourceName: "fourc.png"), nil, nil, nil);
            default:
                break
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }


}

