//
//  WalkthoughViewController.swift
//  CardTrick
//
//  Created by Abdulaziz Ismail on 15/12/2017.
//  Copyright © 2017 Abdulaziz Ismail. All rights reserved.
//

import UIKit

class WalkthoughViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //creating frist view
        var Page1 : PageOneViewController = PageOneViewController(nibName: "PageOneViewController", bundle: nil)
        var Page2 : Page2ViewController = Page2ViewController(nibName: "Page2ViewController", bundle: nil)
        var Page3 : page3ViewController = page3ViewController(nibName: "page3ViewController", bundle: nil)
        var Page4 : Page4ViewController = Page4ViewController(nibName: "Page4ViewController", bundle: nil)
        
        self.addChildViewController(Page1)
        self.scrollView.addSubview(Page1.view)
        Page1.didMove(toParentViewController: self)

        
        self.addChildViewController(Page2)
        self.scrollView.addSubview(Page2.view)
        Page2.didMove(toParentViewController: self)
        
        self.addChildViewController(Page3)
        self.scrollView.addSubview(Page3.view)
        Page3.didMove(toParentViewController: self)
        
        self.addChildViewController(Page4)
        self.scrollView.addSubview(Page4.view)
        Page4.didMove(toParentViewController: self)
        
        var page2Frame : CGRect = Page2.view.frame
        page2Frame.origin.x = self.view.frame.width
        Page2.view.frame = page2Frame
        
        var page3Frame : CGRect = Page3.view.frame
        page3Frame.origin.x = 2 * self.view.frame.width
        Page3.view.frame = page3Frame
        
        var page4Frame : CGRect = Page4.view.frame
        page4Frame.origin.x = 3 * self.view.frame.width
        Page4.view.frame = page4Frame

        
        self.scrollView.contentSize = CGSize(width: self.view.frame.width * 4, height: self.view.frame.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
