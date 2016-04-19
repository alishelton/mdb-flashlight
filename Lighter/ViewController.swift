//
//  ViewController.swift
//  Lighter
//
//  Created by Ali Shelton on 2/15/16.
//  Copyright © 2016 Ali Shelton. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    @IBOutlet weak var lightingLabel: UILabel!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        lightingLabel.text = "Hi"
        if let device = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo){
            if (device.hasTorch) {
                do {
                    try device.lockForConfiguration()
                    if (device.torchMode == AVCaptureTorchMode.On) {
                        device.torchMode = AVCaptureTorchMode.Off
                        lightingLabel.text = ""
                    }
                else {
                        try device.setTorchModeOnWithLevel(1.0)
                        lightingLabel.text = "It's Lit!"
                    }
                device.unlockForConfiguration()
                } catch {
                    print(error)
                }
            }
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func shouldAutorotate() -> Bool {
        if (UIDevice.currentDevice().orientation == UIDeviceOrientation.LandscapeLeft ||
            UIDevice.currentDevice().orientation == UIDeviceOrientation.LandscapeRight ||
            UIDevice.currentDevice().orientation == UIDeviceOrientation.Unknown) {
                return false;
        }
        else {
            return true;
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

