//
//  LoginViewController.m
//  rs.ios.stage-task7
//
//  Created by Źmicier Fiedčanka on 2.07.21.
//

#import "LoginViewController.h"
#import "RSTextField.h"
#import "RSAuthButton.h"


@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet RSTextField *loginTextField;
@property (weak, nonatomic) IBOutlet RSTextField *passwordTextField;
@property (weak, nonatomic) IBOutlet RSAuthButton *authButton;
@property (weak, nonatomic) IBOutlet UIView *secureView;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation LoginViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self confuigureSecureView];
    [self configureHidingKeyboardOnTap];
    [self configureTextFields];
    self.enteredValues = [[NSMutableArray alloc] init];
}

//MARK: Configuration
- (void)configureTextFields {
    [self.loginTextField setKeyboardType:UIKeyboardTypeASCIICapable];
    self.loginTextField.delegate    = self;
    
    self.passwordTextField.delegate = self;
    [self.passwordTextField setEnabled:NO];
    [self.passwordTextField setSecureTextEntry:YES];
    [self.passwordTextField setEnabled:YES];
}

- (void)confuigureSecureView {
    [self.secureView.layer setCornerRadius:10];
    [self.secureView.layer setBorderWidth:2];
    [self.secureView.layer setBorderColor:[UIColor clearColor].CGColor];
    [self.secureView setBackgroundColor:[UIColor whiteColor]];
}

- (IBAction)editingChanged:(RSTextField *)sender {
    [sender setState:@"ready"];
}

//MARK: Hiding keyboard on tap
- (void)configureHidingKeyboardOnTap {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.view addGestureRecognizer:tap];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self hideKeyboard];
    return YES;
}

- (void)hideKeyboard {
    [self.view endEditing:YES];
}


//MARK: Authorize
- (IBAction)authorizeButtonTapped:(id)sender {
    [self authorize];
}

- (void) authorize {
    BOOL loginIsCorrect         = [self.loginTextField.text isEqualToString:@"username"];
    BOOL passwordIsCorrect      = [self.passwordTextField.text isEqualToString:@"password"];
    BOOL credentialsAreCorrect  = loginIsCorrect && passwordIsCorrect;
    
    if (credentialsAreCorrect) {
        [self.loginTextField setState:@"success"];
        [self.passwordTextField setState:@"success"];
        [self.secureView setHidden:NO];
        [self.authButton setEnabled:NO];
        [self.authButton setAlpha:0.5];
    } else {
        if (!loginIsCorrect) {
            [self.loginTextField setState:@"error"];
        }
        if (!passwordIsCorrect) {
            [self.passwordTextField setState:@"error"];
        }
    }
}

//MARK: Secure field
- (IBAction)secureButtonTapped:(UIButton *)sender {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber* senderValue = [formatter numberFromString:sender.titleLabel.text];
    [self.enteredValues addObject: senderValue];
    
    if (self.enteredValues.count == 1) {
        [self.resultLabel setText:@" "];
    }
    
    [self.resultLabel setText:[self.resultLabel.text stringByAppendingFormat: @"%d ", senderValue.intValue]];
    
    if (self.enteredValues.count == 3) {
        if ([self.enteredValues isEqualToArray:@[@1, @3, @2]]) {
            [self.secureView.layer setBorderColor:[UIColor colorNamed:@"Turquoise Green"].CGColor];
            [self presentAlertController];
        } else {
            [self.resultLabel setText:@"_"];
            [self.enteredValues removeAllObjects];
            [self.secureView.layer setBorderColor:[UIColor colorNamed:@"Venetian Red"].CGColor];
        }
    } else {
        [self.secureView.layer setBorderColor:[UIColor clearColor].CGColor];
    }
}

- (void)presentAlertController {
    UIAlertController *alertvc=[UIAlertController alertControllerWithTitle:@"Welcome" message:@"You are successfuly authorized!" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *refreshAction = [UIAlertAction actionWithTitle:@"Refresh" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [self setViewToDefaultState];
    }];
    [alertvc addAction:refreshAction];
    [self presentViewController:alertvc animated:YES completion:nil];
}

- (void)setViewToDefaultState {
    [self.secureView setHidden:YES];
    [self.passwordTextField setState:@"ready"];
    [self.loginTextField setState:@"ready"];
    [self.passwordTextField setText:@""];
    [self.loginTextField setText:@""];
    [self.enteredValues removeAllObjects];
    [self.authButton setEnabled:YES];
    [self.authButton setAlpha:1];
}

@end
