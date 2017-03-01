//
//  ViewController.swift
//  CardTrick
//
//  Created by Abdulaziz Ismail on 01/03/2017.
//  Copyright © 2017 Abdulaziz Ismail. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
                print("Swiped right")
               // UIImageWriteToSavedPhotosAlbum(#imageLiteral(resourceName: "onec.png"), nil, nil, nil);
            case UISwipeGestureRecognizerDirection.down:
                print("Swiped down")
               // UIImageWriteToSavedPhotosAlbum(#imageLiteral(resourceName: "twoc.png"), nil, nil, nil);
            case UISwipeGestureRecognizerDirection.left:
                print("Swiped left")
             //   UIImageWriteToSavedPhotosAlbum(#imageLiteral(resourceName: "threec.png"), nil, nil, nil);
            case UISwipeGestureRecognizerDirection.up:
                print("Swiped up")
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


}

