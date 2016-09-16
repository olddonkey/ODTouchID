//
//  ODTouchID.swift
//  ODTouchIDExample
//
//  Created by olddonkey on 2016/9/15.
//  Copyright © 2016年 olddonkey. All rights reserved.
//

import Foundation
import LocalAuthentication

protocol ODTouchIDProtocol {
    //Must be implemented
    func ODTouchIDAuthorizeSuccess()
    func ODTouchIDAuthorizeFail()
    //Optional
    func ODTouchIDUserCancelled()
    func ODTouchIDUserChooseFallBack()
    func ODTouchIDSystemTerminate()
    func ODTouchIDNoPassword()
    func ODTouchIDNotAvailable()
    func ODTouchIDNoFingerPrint()
    func ODTouchIDDeviceNotSupportTouchID()
    func ODTouchIDDeviceIsSimulator()
    
    //Only available in iOS 9 or high
    func ODTouchIDAppCancelled()
    func ODTouchIDInvalidContext()
    func ODTouchIDTouchIDLockout()
}

extension ODTouchIDProtocol{
    func ODTouchIDUserCancelled(){}
    func ODTouchIDUserChooseFallBack(){}
    func ODTouchIDSystemTerminate(){}
    func ODTouchIDNoPassword(){}
    func ODTouchIDNotAvailAble(){}
    func ODTouchIDNoFingerPrint(){}
    func ODTouchIDDeviceNotSupportTouchID(){}
    func ODTouchIDDeviceIsSimulator(){}
    func ODTouchIDAppCancelled(){}
    func ODTouchIDInvalidContext(){}
    func ODTouchIDTouchIDLockout(){}
}

class ODTouchID {
    static var touchID:ODTouchID?
    
    var delegate:ODTouchIDProtocol?
    
    class func StartODTouchID(messageOnAuth:String, fallbackTitle:String, delegate:ODTouchIDProtocol){
        let context = LAContext()
        var authError: NSError? = nil
        if context.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &authError) {
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: messageOnAuth, reply: { (success, evalPolicyError) in
                if success {
                    DispatchQueue.main.async {
                        delegate.ODTouchIDAuthorizeSuccess()
                    }
                }else{
                    if #available(iOS 9.0,*){
                        if (evalPolicyError as! LAError).code == .appCancel {
                            delegate.ODTouchIDAppCancelled()
                        }else if (evalPolicyError as! LAError).code == .appCancel {
                            delegate.ODTouchIDInvalidContext()
                        }else if (evalPolicyError as! LAError).code == .appCancel{
                            delegate.ODTouchIDTouchIDLockout()
                        }
                    }
                    switch (evalPolicyError as! LAError).code {
                    case .authenticationFailed:
                        delegate.ODTouchIDAuthorizeFail()
                    case .userCancel:
                        delegate.ODTouchIDUserCancelled()
                    case .userFallback:
                        delegate.ODTouchIDUserChooseFallBack()
                    case .systemCancel:
                        delegate.ODTouchIDSystemTerminate()
                    case .passcodeNotSet:
                        delegate.ODTouchIDNoPassword()
                    case .touchIDNotAvailable:
                        delegate.ODTouchIDNotAvailAble()
                    case .touchIDNotEnrolled:
                        delegate.ODTouchIDNoFingerPrint()
                    default:
                        delegate.ODTouchIDNotAvailable()
                    }
                }
            })
        }else{
            if Platform.isSimulator {
                print("Please use Real phone")
                delegate.ODTouchIDDeviceIsSimulator()
            }
            else{
                delegate.ODTouchIDDeviceNotSupportTouchID()
            }
        }
    }
}

/// Struct use for checking runtime platform if it's simulator
struct Platform {
    static let isSimulator: Bool = {
        var isSim = false
        #if arch(i386) || arch(x86_64)
            isSim = true
        #endif
        return isSim
    }()
}
