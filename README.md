# OSXPreventSleep

[![CI Status](http://img.shields.io/travis/Jindrich Sarson/OSXPreventSleep.svg?style=flat)](https://travis-ci.org/Jindrich Sarson/OSXPreventSleep)
[![Version](https://img.shields.io/cocoapods/v/OSXPreventSleep.svg?style=flat)](http://cocoapods.org/pods/OSXPreventSleep)
[![License](https://img.shields.io/cocoapods/l/OSXPreventSleep.svg?style=flat)](http://cocoapods.org/pods/OSXPreventSleep)
[![Platform](https://img.shields.io/cocoapods/p/OSXPreventSleep.svg?style=flat)](http://cocoapods.org/pods/OSXPreventSleep)

## Example

This simple class allows to disable automatic sleep mode on OS X. Handy when developing app thats playing video, shows slideshow etc.

```objective-c
  [OSXPreventSleep instance].preventSleep = YES // disable sleeping of OS X

  [OSXPreventSleep instance].preventSleep = NO  // enable sleeping of OS X

```

## Installation

OSXPreventSleep is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "OSXPreventSleep"
```

## Author

Jindrich Sarson, jindra@tappytaps.com

## License

OSXPreventSleep is available under the MIT license. See the LICENSE file for more info.
