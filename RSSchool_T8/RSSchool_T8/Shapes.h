//
//  Shapes.h
//  RSSchool_T8
//
//  Created by Нехай Роман on 7/18/21.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ArtistViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface Shapes : NSObject

+ (NSArray<UIBezierPath *> *)getShape:(Shape)shape;

@end

NS_ASSUME_NONNULL_END
