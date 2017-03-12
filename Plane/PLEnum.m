//
//  PLEnum.m
//  Plane
//
//  Created by JefferyKao on 2017/3/12.
//  Copyright © 2017年 bike. All rights reserved.
//

#import "PLEnum.h"

@implementation PLEnum
+ (NSString *)PLMissileTypeToStringWithMissileType:(PLMissileType)type {
    switch (type) {
        case PLMissileTypeDavincci: return @"missile-type-1";
        case PLMissileTypeBacon: return @"missile-type-2";
        case PLMissileTypeNewton: return @"missile-type-3";
    }
    return @"";
}

+ (NSString *)PLMissileFileTypeToStringWithMissileType:(PLMissileType)type {
    switch (type) {
        case PLMissileTypeDavincci: return @"missile1";
        case PLMissileTypeBacon: return @"missile2";
        case PLMissileTypeNewton: return @"missile3";
    }
    return @"";
}

@end
