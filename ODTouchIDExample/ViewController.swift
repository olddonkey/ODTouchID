//
//  ViewController.swift
//  ODTouchIDExample
//
//  Created by olddonkey on 2016/9/15.
//  Copyright © 2016年 olddonkey. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController, ODTouchIDProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Use class method to initODTouchID
        ODTouchID.StartODTouchID(messageOnAuth: "TEST", fallbackTitle: "Fallback", delegate: self)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func ODTouchIDAuthorizeSuccess() {
        print("verify succeeded")
    }
    
    func ODTouchIDAuthorizeFail() {
        print("verify failed")
    }
    
    func ODTouchIDUserCancelled() {
        print("Cancelled")
    }
    
    func ODTouchIDUserChooseFallBack(){
        print("UserChooseFallBack")
    }
    
    func ODTouchIDSystemTerminate(){
        print("SystemTerminate")
    }
    
    func ODTouchIDNoPassword(){
        print("No password")
    }
    
    func ODTouchIDNotAvailable(){
        print("Touch ID not available")
    }
    
    func ODTouchIDNoFingerPrint(){
        print("No Finger Print in system")
    }
    
    func ODTouchIDDeviceNotSupportTouchID(){
        print("Device don't SupportTouchID")
    }
    
    func ODTouchIDDeviceIsSimulator(){
        print("Device is simulator, please use real phone to test")
    }
    
    //Only available in iOS 9 or higher
    func ODTouchIDAppCancelled(){
        print("Touch ID cancelled, this only available in iOS9 or higher")
    }
    
    func ODTouchIDInvalidContext(){
        print("Invalid context")
    }
    
    func ODTouchIDTouchIDLockout(){
        print("TouchID lockout")
    }


}

