//
//  ViewController.swift
//  SwiftySnapBehaviour
//
//  Created by Sugam Kalra on 20/01/18.
//  Copyright © 2018 Sugam Kalra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imgvApple: UIImageView!
    var animator:UIDynamicAnimator!
    var snapBehaviour:UISnapBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create the Tap Gesture Recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(userHasTapped))
        self.view.addGestureRecognizer(tapGesture)
        
        // Create the Dynamic Animator
        animator = UIDynamicAnimator(referenceView: self.view)
    }
    
    @objc func userHasTapped(tap:UITapGestureRecognizer) {
        let touchPoint = tap.location(in: self.view)
        if snapBehaviour != nil {
            animator.removeBehavior(snapBehaviour)
        }
        
        snapBehaviour = UISnapBehavior(item: imgvApple, snapTo: touchPoint)
        snapBehaviour.damping = 0.3
        animator.addBehavior(snapBehaviour)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


