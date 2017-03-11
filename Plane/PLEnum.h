//
//  PLEnum.h
//  Plane
//
//  Created by JefferyKao on 2017/3/12.
//  Copyright © 2017年 bike. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PLBaconMissile.h"
#import "PLNewtonMissile.h"
#import "PLDavincciMissile.h"

typedef NS_OPTIONS(NSUInteger, PLGameStatus) {
    PLGameStatusInPreparation       = 0,        // In Preparation
    PLGameStatusInGame              = 1 << 0    // In Game
};

typedef NS_ENUM(NSInteger, PLMissileType) {
    PLMissileTypeDavincci           = 0,
    PLMissileTypeBacon              = 1,
    PLMissileTypeNewton             = 2
};

@interface PLEnum : NSObject
+ (NSString *)PLMissileTypeToStringWithMissileType:(PLMissileType)type;
@end
