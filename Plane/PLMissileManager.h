//
//  PLMissileManager.h
//  Plane
//
//  Created by JefferyKao on 2017/3/12.
//  Copyright © 2017年 bike. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PLEnum.h"
#import "PLMissileInterface.h"

@interface PLMissileManager : NSObject
+ (id<PLMissileInterface>)missileFromMissileType:(PLMissileType)type;
@end
