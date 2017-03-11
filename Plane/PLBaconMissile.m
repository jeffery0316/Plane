//
//  PLBaconMissile.m
//  Plane
//
//  Created by JefferyKao on 2017/3/11.
//  Copyright © 2017年 bike. All rights reserved.
//

#import "PLBaconMissile.h"

@implementation PLBaconMissile

- (NSInteger)powerCost
{
    return 2;
}

- (NSString *)missileName
{
    return @"Bacon";
}

- (NSInteger)speed {
    return 75.f;
}

@end
