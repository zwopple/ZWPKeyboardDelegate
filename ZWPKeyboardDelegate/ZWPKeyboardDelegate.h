#import <UIKit/UIKit.h>

@protocol ZWPKeyboardDelegate <NSObject>
@optional
- (void)keyboardWillShowNotification:(NSNotification *)notification;
- (void)keyboardDidShowNotification:(NSNotification *)notification;
- (void)keyboardWillHideNotification:(NSNotification *)notification;
- (void)keyboardDidHideNotification:(NSNotification *)notification;
@end

void ZWPKeyboardDelegateToggleNotificationObservers(id <ZWPKeyboardDelegate> target, BOOL toggled);
void ZWPKeyboardDelegateAddNotificationObservers(id <ZWPKeyboardDelegate> target);
void ZWPKeyboardDelegateRemoveNotificationObservers(id <ZWPKeyboardDelegate> target);
void ZWPKeyboardAnimateWithNotification(NSNotification *notification, void (^animations)(void), void (^completion)(BOOL finished));

