//
//  PLMissileManager.m
//  Plane
//
//  Created by JefferyKao on 2017/3/12.
//  Copyright © 2017年 bike. All rights reserved.
//

#import "PLMissileManager.h"

@implementation PLMissileManager

+ (id<PLMissileInterface>)missileFromMissileType:(PLMissileType)type {
    NSString *className = [self classNameFromMissileType:type];
    if(className.length == 0){
        return nil;
    }

    id <PLMissileInterface> class = [[NSClassFromString(className) alloc] init];

    return class;
}

+ (NSString *)classNameFromMissileType:(PLMissileType)type {
    switch (type) {
        case PLMissileTypeDavincci: return @"PLDavincciMissile";
        case PLMissileTypeBacon: return @"PLBaconMissile";
        case PLMissileTypeNewton: return @"PLNewtonMissile";
    }
}

@end
