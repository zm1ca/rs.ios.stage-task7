//
//  RSTextField.m
//  rs.ios.stage-task7
//
//  Created by Źmicier Fiedčanka on 2.07.21.
//

#import "RSTextField.h"

@implementation RSTextField

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self configure];
        [self setState:@"ready"];
    }
    return self;
}

- (void)configure {
    [self.layer setCornerRadius:5];
    [self.layer setBorderWidth:1.5];
}

- (void)setState:(NSString *)state {
    if ([state isEqualToString:@"ready"]) {
        [self.layer setBorderColor:[UIColor colorNamed:@"Black Coral"].CGColor];
    } else if ([state isEqualToString:@"success"]) {
        [self.layer setBorderColor:[UIColor colorNamed:@"Turquoise Green"].CGColor];
        [self setEnabled:NO];
        [self setAlpha:0.5];
    } else if ([state isEqualToString:@"error"]) {
        [self.layer setBorderColor:[UIColor colorNamed:@"Venetian Red"].CGColor];
    } else {
        NSLog(@"Unknown state");
    }
}

@end
