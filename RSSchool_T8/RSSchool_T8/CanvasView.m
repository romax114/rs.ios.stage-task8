//
//  CanvasView.m
//  RSSchool_T8
//
//  Created by Нехай Роман on 7/18/21.
//

#import "CanvasView.h"

IB_DESIGNABLE
@implementation CanvasView

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
    self.layer.cornerRadius = 8;
    self.layer.shadowOffset = CGSizeMake(0, 0);
    self.layer.shadowOpacity = 0.25;
    self.layer.shadowColor = [UIColor colorNamed:@"Chill Sky"].CGColor;
    self.layer.shadowRadius = 8;

    self.backgroundColor = [UIColor whiteColor];

    self.layer1 = [[CAShapeLayer alloc] init];
    self.layer2 = [[CAShapeLayer alloc] init];
    self.layer3 = [[CAShapeLayer alloc] init];
    self.layer1.fillColor = [UIColor clearColor].CGColor;
    self.layer2.fillColor = [UIColor clearColor].CGColor;
    self.layer3.fillColor = [UIColor clearColor].CGColor;
    self.layer1.strokeEnd = 0;
    self.layer2.strokeEnd = 0;
    self.layer3.strokeEnd = 0;
    [self.layer addSublayer:self.layer1];
    [self.layer addSublayer:self.layer2];
    [self.layer addSublayer:self.layer3];
}

- (void)prepareForInterfaceBuilder {
    [super prepareForInterfaceBuilder];
    [self setup];
}

@end
