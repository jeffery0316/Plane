//
//  PlaneView.h
//  PlaneView
//
//  Created by JefferyKao on 2017/3/11.
//  Copyright © 2017年 bike. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PLPlane.h"

@interface PlaneView : UIView
- (instancetype)initWithPlane:(PLPlane *)plane position:(CGPoint)position;
@end
