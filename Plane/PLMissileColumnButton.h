//
//  PLMissileColumnView.h
//  Plane
//
//  Created by JefferyKao on 2017/3/11.
//  Copyright © 2017年 bike. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PLEnum.h"

@class PLMissileColumnButton;
@protocol PLMissileColumnButtonDelegate <NSObject>
- (void)missileColumnButton:(PLMissileColumnButton *)missileColumnView didSelectMissileType:(PLMissileType)missileType;
@end

@interface PLMissileColumnButton : UIButton
@property (weak, nonatomic) id <PLMissileColumnButtonDelegate> delegate;
- (void)configureWithMissileType:(PLMissileType)type position:(CGPoint)position;
@end
