//
//  ColorView.h
//  RSSchool_T8
//
//  Created by Нехай Роман on 7/18/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ColorView : UIView

@property (nonatomic) BOOL isSelected;

- (void)setSelected:(BOOL)selected;
- (UIColor *)getColor;

@end

NS_ASSUME_NONNULL_END
