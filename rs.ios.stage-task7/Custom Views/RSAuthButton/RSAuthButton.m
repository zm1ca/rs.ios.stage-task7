//
//  RSAuthButton.m
//  rs.ios.stage-task7
//
//  Created by Źmicier Fiedčanka on 2.07.21.
//

#import "RSAuthButton.h"

@implementation RSAuthButton

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setImage:[UIImage imageNamed:@"person"] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:@"personfill"] forState:UIControlStateHighlighted];
    [self setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 5)];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
    [self.layer setBorderColor:[UIColor colorNamed:@"Little Boy Blue"].CGColor];
    [self.layer setBorderWidth:2];
    [self.layer setCornerRadius:10];
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];

    if (highlighted) {
        self.backgroundColor = [[UIColor colorNamed:@"Little Boy Blue"] colorWithAlphaComponent:0.2];
    }
    else{
        self.backgroundColor = [UIColor whiteColor];
    }

}

@end
