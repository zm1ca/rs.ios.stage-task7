//
//  LoginViewController.m
//  rs.ios.stage-task7
//
//  Created by Źmicier Fiedčanka on 2.07.21.
//

#import "LoginViewController.h"
#import "RSTextField.h"
#import "RSButton.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet RSTextField *loginTextField;
@property (weak, nonatomic) IBOutlet RSTextField *passwordTextField;
@property (weak, nonatomic) IBOutlet RSButton *authButton;
@property (weak, nonatomic) IBOutlet UIView *secureView;

@end

@implementation LoginViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    [self confuigureSecureView];
}

- (void)confuigureSecureView {
    [self.secureView.layer setCornerRadius:10];
    [self.secureView.layer setBorderWidth:2];
    [self.secureView setBackgroundColor:[UIColor whiteColor]];
}

- (IBAction)authoriseButtonTapped:(id)sender {
    BOOL loginIsCorrect         = [self.loginTextField.text isEqualToString:@"username"];
    BOOL passwordIsCorrect      = [self.passwordTextField.text isEqualToString:@"password"];
    BOOL credentialsAreCorrect  = loginIsCorrect && passwordIsCorrect;
    
    if (credentialsAreCorrect) {
        [self.loginTextField setState:@"success"];
        [self.passwordTextField setState:@"success"];
    } else {
        if (!loginIsCorrect) {
            [self.loginTextField setState:@"error"];
        }
        
        if (!passwordIsCorrect) {
            [self.passwordTextField setState:@"error"];
        }
    }
}

- (IBAction)editingChanged:(RSTextField *)sender {
    [sender setState:@"ready"];
}


@end
