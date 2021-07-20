//
//  ActionButton.m
//  RSSchool_T8
//
//  Created by Нехай Роман on 7/18/21.
//

#import "ActionButton.h"

IB_DESIGNABLE
@implementation ActionButton

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.layer.borderWidth = CGFLOAT_MIN;
    self.layer.cornerRadius = 10;
    self.layer.shadowOffset = CGSizeMake(0, 0);
    self.layer.shadowOpacity = 1;
    self.layer.shadowColor = [[UIColor blackColor] colorWithAlphaComponent:0.25].CGColor;
    self.layer.shadowRadius = 2;

    self.backgroundColor = [UIColor whiteColor];
    self.contentEdgeInsets = UIEdgeInsetsMake(5, 21, 5, 21);

    self.titleLabel.font = [UIFont fontWithName:@"Montserrat-Medium" size:18];
    [self setTitleColor:[UIView appearance].tintColor forState:UIControlStateNormal];

    [self setEnabled:self.isEnabled];
}

- (void)prepareForInterfaceBuilder {
    [super prepareForInterfaceBuilder];
    [self setup];
}

- (void)setHighlighted:(BOOL)highlighted {
    if (self.nowSelected) {
        return;
    }
    if (highlighted) {
        self.layer.shadowColor = self.tintColor.CGColor;
        self.layer.shadowRadius = 4;
    } else {
        self.layer.shadowColor = [[UIColor blackColor] colorWithAlphaComponent:0.25].CGColor;
        self.layer.shadowRadius = 2;
    }
}

- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    if (enabled) {
        self.layer.shadowOpacity = 1;
        self.alpha = 1;
    } else {
        self.layer.shadowOpacity = 0.5;
        self.alpha = 0.5;
    }
}

- (void)setNowSelected:(BOOL)nowSelected {
    _nowSelected = nowSelected;
    if (nowSelected) {
        self.layer.shadowColor = [[UIView appearance] tintColor].CGColor;
        self.layer.shadowRadius = 4;
    } else {
        self.layer.shadowColor = [[UIColor blackColor] colorWithAlphaComponent:0.25].CGColor;
        self.layer.shadowRadius = 2;
    }
}

@end
