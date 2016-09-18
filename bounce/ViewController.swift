//
//  ViewController.swift
//  bounce
//
//  Created by Gianni Settino on 2016-09-15.
//  Copyright © 2016 Milton and Parc. All rights reserved.
//

import CoreMotion
import UIKit

class ViewController: UIViewController {
    
    private let motionManager = CMMotionManager()
    private let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        label.textColor = UIColor.white
        label.numberOfLines = 0
        view.addSubview(label)
        
        motionManager.deviceMotionUpdateInterval = 0.01
        motionManager.startDeviceMotionUpdates(to: OperationQueue.main) { (data: CMDeviceMotion?, error: Error?) in
            if let acceleration = data?.userAcceleration {
                self.label.text = "x = \(acceleration.x)\ny = \(acceleration.y)\nz = \(acceleration.z)"
                self.label.sizeToFit()
            }
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
