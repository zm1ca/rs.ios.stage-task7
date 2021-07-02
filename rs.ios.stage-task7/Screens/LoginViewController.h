//
//  LoginViewController.h
//  rs.ios.stage-task7
//
//  Created by Źmicier Fiedčanka on 2.07.21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) NSMutableArray<NSNumber *>*enteredValues;

@end

NS_ASSUME_NONNULL_END
