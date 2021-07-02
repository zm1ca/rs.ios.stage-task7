//
//  RSSecureButton.m
//  rs.ios.stage-task7
//
//  Created by Źmicier Fiedčanka on 2.07.21.
//

#import "RSSecureButton.h"

@implementation RSSecureButton

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.layer setCornerRadius:25];
    [self.layer setBorderWidth:1.5];
    [self.layer setBorderColor:[UIColor colorNamed:@"Little Boy Blue"].CGColor];
}

- (void)setDefaultState {
    
}

- (void)setHighlightedState {
    
}

- (void)setDisabledState {
    
}

@end
