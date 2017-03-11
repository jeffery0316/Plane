//
//  PLMissileColumnView.h
//  Plane
//
//  Created by JefferyKao on 2017/3/11.
//  Copyright © 2017年 bike. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PLEnum.h"

@class PLMissileColumnView;
@protocol PLMissileColumnViewDelegate <NSObject>
- (void)missileColumnView:(PLMissileColumnView *)missileColumnView didSelectMissileType:(PLMissileType)missileType;
@end

@interface PLMissileColumnView : UIView
@property (weak, nonatomic) id <PLMissileColumnViewDelegate> delegate;
- (void)configureWithMissileType:(PLMissileType)type position:(CGPoint)position;
@end
