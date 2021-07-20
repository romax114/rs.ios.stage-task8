//
//  ColorView.m
//  RSSchool_T8
//
//  Created by Нехай Роман on 7/18/21.
//

#import "ColorView.h"

@interface ColorView ()

@property CALayer *colorLayer;

@end

IB_DESIGNABLE
@implementation ColorView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.colorLayer = [[CALayer alloc] init];
    self.colorLayer.frame = CGRectMake(8, 8, self.layer.bounds.size.width - 16, self.layer.bounds.size.height - 16);
    self.colorLayer.backgroundColor = self.tintColor.CGColor;
    self.colorLayer.cornerRadius = 6;
    [self.layer addSublayer:self.colorLayer];

    self.layer.borderWidth = CGFLOAT_MIN;
    self.layer.cornerRadius = 10;
    self.layer.shadowOffset = CGSizeMake(0, 0);
    self.layer.shadowOpacity = 0.25;
    self.layer.shadowRadius = 2;

    self.backgroundColor = [UIColor whiteColor];
}

- (void)prepareForInterfaceBuilder {
    [super prepareForInterfaceBuilder];
    [self setup];
}

- (void)viewTapped {
    [self setSelected:!self.isSelected];
}

- (void)setSelected:(BOOL)selected {
    self.isSelected = selected;
    if (selected) {
        self.colorLayer.frame = CGRectMake(2, 2, self.layer.bounds.size.width - 4, self.layer.bounds.size.height - 4);
        self.colorLayer.cornerRadius = 8;
    } else {
        self.colorLayer.frame = CGRectMake(8, 8, self.layer.bounds.size.width - 16, self.layer.bounds.size.height - 16);
        self.colorLayer.cornerRadius = 6;
    }
}

- (UIColor *)getColor {
    return [UIColor colorWithCGColor:self.colorLayer.backgroundColor];
}

@end
