//
//  RSTextField.m
//  rs.ios.stage-task7
//
//  Created by Źmicier Fiedčanka on 2.07.21.
//

#import "RSTextField.h"

@implementation RSTextField

- (void)awakeFromNib {
    [super awakeFromNib];
    [self configure];
    [self setState:@"ready"];
}

- (void)configure {
    [self.layer setCornerRadius:5];
    [self.layer setBorderWidth:1.5];
    [self setTextContentType:UITextContentTypeOneTimeCode];
}

- (void)setState:(NSString *)state {
    if ([state isEqualToString:@"ready"]) {
        [self.layer setBorderColor:[UIColor colorNamed:@"Black Coral"].CGColor];
        [self setEnabled:YES];
        [self setAlpha:1];
    } else if ([state isEqualToString:@"success"]) {
        [self.layer setBorderColor:[UIColor colorNamed:@"Turquoise Green"].CGColor];
    } else if ([state isEqualToString:@"error"]) {
        [self.layer setBorderColor:[UIColor colorNamed:@"Venetian Red"].CGColor];
    } else {
        NSLog(@"Unknown state");
    }
}

//ready -> error || success
//success -> ready
//error -> ready

@end
