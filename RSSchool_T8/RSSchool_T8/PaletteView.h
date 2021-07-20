//
//  PaletteView.h
//  RSSchool_T8
//
//  Created by Нехай Роман on 7/18/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PaletteView : UIView

- (void)setColorButtonTap:(void (^)(UIColor *))colorButtonTapped;

@end

NS_ASSUME_NONNULL_END
