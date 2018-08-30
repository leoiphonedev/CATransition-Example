//
//  ViewController.swift
//  CATransition-Example
//
//  Created by Aman Aggarwal on 29/08/18.
//  Copyright © 2018 Aman Aggarwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblCounter: UILabel!
    var counter = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func incrementCounter(_ sender: Any) {
        lblCounter.layer.bottomAnimation(duration: 0.7)
        counter = counter + 1
        lblCounter.text = "\(counter)"
    }
    
    @IBAction func devrementCounter(_ sender: Any) {
        if counter > 0 {
            lblCounter.layer.topAnimation(duration: 0.7)
            counter = counter - 1
            lblCounter.text = "\(counter)"
        }
    }
}

extension CALayer {
    
    func bottomAnimation(duration:CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.duration = duration
        animation.type = kCATransitionPush
        animation.subtype = kCATransitionFromTop
        self.add(animation, forKey: kCATransitionPush)
    }
    
    func topAnimation(duration:CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.duration = duration
        animation.type = kCATransitionPush
        animation.subtype = kCATransitionFromBottom
        self.add(animation, forKey: kCATransitionPush)
    }
}

