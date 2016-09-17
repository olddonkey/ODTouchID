<p align="center">

<img src="https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/logo.png" alt="Kingfisher" title="Kingfisher" width="557"/>

</p>

<p align="center">

<a href="https://travis-ci.org/onevcat/Kingfisher"><img src="https://img.shields.io/travis/onevcat/Kingfisher/master.svg"></a>

<a href="https://github.com/Carthage/Carthage/"><img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat"></a>

<a href="https://swift.org/package-manager/"><img src="https://img.shields.io/badge/SPM-ready-orange.svg"></a>

<a href="http://cocoadocs.org/docsets/Kingfisher"><img src="https://img.shields.io/cocoapods/v/Kingfisher.svg?style=flat"></a>

<a href="https://raw.githubusercontent.com/onevcat/Kingfisher/master/LICENSE"><img src="https://img.shields.io/cocoapods/l/Kingfisher.svg?style=flat"></a>

<a href="http://cocoadocs.org/docsets/Kingfisher"><img src="https://img.shields.io/cocoapods/p/Kingfisher.svg?style=flat"></a>

<a href="https://codebeat.co/projects/github-com-onevcat-kingfisher"><img alt="codebeat badge" src="https://codebeat.co/assets/svg/badges/A-398b39-669406e9e1b136187b91af587d4092b0160370f271f66a651f444b990c2730e9.svg" /></a>

<img src="https://img.shields.io/badge/made%20with-%3C3-orange.svg">


</p>

Kingfisher is a lightweight and pure Swift implemented library for downloading and caching image from the web. This project is heavily inspired by the popular [SDWebImage](https://github.com/rs/SDWebImage). And it provides you a chance to use pure Swift alternative in your next app.

## Features

- [x] Easily use Touch ID in your project


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

It will download the image from `url`, send it to both memory and disk cache, then show it in the `imageView`. When you use the same code later, the image will be retrieved from cache and show immediately.

## Requirements

- iOS 8.0+ 
- Swift 3 

The main development of Kingfisher is based on Swift 3.

### Contact

Follow and contact me through [email](olddonkeyblog@gmail.com). If you find an issue, just [open a ticket](https://github.com/olddonkey/ODTouchID/issues/new) on it. Pull requests are warmly welcome as well.

### License

ODTouchID is released under the MIT license. See LICENSE for details.


