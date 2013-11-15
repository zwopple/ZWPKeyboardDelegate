#import "ZWPKeyboardDelegate.h"

void ZWPKeyboardDelegateToggleNotificationObservers(id <ZWPKeyboardDelegate> target, BOOL toggled) {
	NSArray *selectorNames = @[@"keyboardWillShowNotification:", @"keyboardDidShowNotification:", @"keyboardWillHideNotification:", @"keyboardDidHideNotification:"];
	NSArray *notificationNames = @[UIKeyboardWillShowNotification, UIKeyboardDidShowNotification, UIKeyboardWillHideNotification, UIKeyboardDidHideNotification];
	[notificationNames enumerateObjectsUsingBlock:^(NSString *notificationName, NSUInteger idx, BOOL *stop) {
		SEL selector = NSSelectorFromString([selectorNames objectAtIndex:idx]);
		if([target respondsToSelector:selector]) {
			if(toggled) {
				[[NSNotificationCenter defaultCenter] addObserver:target
														 selector:selector
															 name:notificationName
														   object:nil];
			} else {
				[[NSNotificationCenter defaultCenter] removeObserver:target
																name:notificationName
															  object:nil];
			}
		}
	}];
}
void ZWPKeyboardDelegateAddNotificationObservers(id <ZWPKeyboardDelegate> target) {
	ZWPKeyboardDelegateToggleNotificationObservers(target, YES);
};
void ZWPKeyboardDelegateRemoveNotificationObservers(id <ZWPKeyboardDelegate> target) {
	ZWPKeyboardDelegateToggleNotificationObservers(target, NO);
};
void ZWPKeyboardAnimateWithNotification(NSNotification *notification, void (^animations)(void), void (^completion)(BOOL finished)) {
    CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
	UIViewAnimationCurve curve = [notification.userInfo[UIKeyboardAnimationCurveUserInfoKey] integerValue];
	UIViewAnimationOptions options = 0;
	
	switch(curve) {
		case UIViewAnimationCurveEaseIn :
			options |= UIViewAnimationOptionCurveEaseIn;
			break;
		case UIViewAnimationCurveEaseInOut :
			options |= UIViewAnimationOptionCurveEaseInOut;
			break;
		case UIViewAnimationCurveEaseOut :
			options |= UIViewAnimationOptionCurveEaseOut;
			break;
		case UIViewAnimationCurveLinear :
			options |= UIViewAnimationOptionCurveLinear;
			break;
        default :
            if((NSInteger)curve == 7) {
                options |= (7 << 16);
            }
            break;
	}
    
    [UIView animateWithDuration:duration delay:0.0 options:options animations:animations completion:completion];
}