//
//  PLMissileView.h
//  Plane
//
//  Created by JefferyKao on 2017/3/11.
//  Copyright © 2017年 bike. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PLMissileInterface.h"

@interface PLMissileView : UIView 
- (void)addAnimation;
- (void)configureWithMissile:(id <PLMissileInterface>)missile;
@end
