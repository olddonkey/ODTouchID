#ODTouchID


</p>

ODTouchID is a small library helps you use TouchID in your project.


## Features

- [x] Easily use Touch ID in your project
- [x] Handle different kinds of errors

```swift
ODTouchID.StartODTouchID(messageOnAuth: "Your message", fallbackTitle: "Your fallback message", delegate: your delegate target)

//Protocol
    func ODTouchIDAuthorizeSuccess() {
        //succeeded
    }
    
    func ODTouchIDAuthorizeFail() {
        //failed
    }
```

## Requirements

- iOS 8.0+ 
- Swift 3 

The main development of ODTouchID is based on Swift 3.

### Contact

Follow and contact me through [email](olddonkeyblog@gmail.com). If you find an issue, just [open a ticket](https://github.com/olddonkey/ODTouchID/issues/new) on it. Pull requests are warmly welcome as well.

### License

ODTouchID is released under the MIT license. See LICENSE for details.


