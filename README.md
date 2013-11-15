# ZWPKeyboardDelegate

Utility to make monitoring and animating with the keyboard state easier! It will help you setup and teardown all the appropriate notifications and also animate along with the keyboard.

## Usage

First ensure you implement the ZWPKeyboardDelegate protocol:

```objc
@interface MyViewController() <ZWPKeyboardDelegate>
```

Next setup the add/remove observers:

```objc
- (void)viewWillAppear:(BOOL)animated {
    ZWPKeyboardDelegateAddNotificationObservers(self);
}
- (void)viewWillDisappear:(BOOL)animated {
    ZWPKeyboardDelegateRemoveNotificationObservers(self);
}
```

Now animate with the keyboard:

```objc
- (void)keyboardWillShowNotification:(NSNotification *)notification {
    ZWPKeyboardAnimateWithNotification(notification, ^{
        // add your animations here!
    }, ^(BOOL finished) {
        NSLog(@"animation finished!");
    });
}
```

## Installation

Add `pod 'ZWPKeyboardDelegate', :git => 'https://github.com/zwopple/ZWPKeyboardDelegate.git` to your `Podfile` and then run `pod install`.

## License

The MIT License (MIT)

Copyright (c) 2013 Zwopple Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.