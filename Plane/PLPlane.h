//
//  PLPlane.h
//  Plane
//
//  Created by JefferyKao on 2017/3/11.
//  Copyright © 2017年 bike. All rights reserved.
//

@import UIKit;
#import <Mantle/Mantle.h>
#import <Foundation/Foundation.h>
#import "PLConfig.h"
#import "PLMissileInterface.h"

@interface PLPlane : NSObject
@property (assign, nonatomic) NSInteger missileAmount;
@property (assign, nonatomic) CGPoint position;
@property (assign, nonatomic) CGSize size;
@property (strong, nonatomic) id <PLMissileInterface> missile;
- (instancetype)initWithPosition:(CGPoint)position;
@end
