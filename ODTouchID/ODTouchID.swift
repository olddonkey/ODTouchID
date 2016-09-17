//
//  ODTouchID.swift
//  ODTouchIDExample
//
//  Created by olddonkey on 2016/9/15.
//  Copyright © 2016年 olddonkey. All rights reserved.
//

import Foundation
import LocalAuthentication


/// Protocol for ODTouchID, two of them are required, rest are optional
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
    
    /// Class function use to start ODTouchID
    ///
    /// - parameter messageOnAuth: The string shows on Touch ID authentication view
    /// - parameter fallbackTitle: The string shows on Touch ID verification failed page
    /// - parameter delegate:      The object hold the delegate
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
                            DispatchQueue.main.async {
                                delegate.ODTouchIDAppCancelled()
                            }
                        }else if (evalPolicyError as! LAError).code == .appCancel {
                            DispatchQueue.main.async {
                                delegate.ODTouchIDInvalidContext()
                            }
                        }else if (evalPolicyError as! LAError).code == .appCancel{
                            DispatchQueue.main.async {
                                delegate.ODTouchIDTouchIDLockout()
                            }
                        }
                    }
                    switch (evalPolicyError as! LAError).code {
                    case .authenticationFailed:
                        DispatchQueue.main.async {
                            delegate.ODTouchIDAuthorizeFail()
                        }
                    case .userCancel:
                        DispatchQueue.main.async {
                            delegate.ODTouchIDUserCancelled()
                        }
                    case .userFallback:
                        DispatchQueue.main.async {
                            delegate.ODTouchIDUserChooseFallBack()
                        }
                    case .systemCancel:
                        DispatchQueue.main.async {
                            delegate.ODTouchIDSystemTerminate()
                        }
                    case .passcodeNotSet:
                        DispatchQueue.main.async {
                            delegate.ODTouchIDNoPassword()
                        }
                    case .touchIDNotAvailable:
                        DispatchQueue.main.async {
                            delegate.ODTouchIDNotAvailAble()
                        }
                    case .touchIDNotEnrolled:
                        DispatchQueue.main.async {
                            delegate.ODTouchIDNoFingerPrint()
                        }
                    default:
                        DispatchQueue.main.async {
                            delegate.ODTouchIDNotAvailable()
                        }
                    }
                }
            })
        }else{
            if Platform.isSimulator {
                print("Please use Real phone")
                DispatchQueue.main.async {
                    delegate.ODTouchIDDeviceIsSimulator()
                }
            }
            else{
                DispatchQueue.main.async {
                    delegate.ODTouchIDDeviceNotSupportTouchID()
                }
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
