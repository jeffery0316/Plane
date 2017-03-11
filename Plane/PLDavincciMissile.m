//
//  PLDavincciMissile.m
//  Plane
//
//  Created by JefferyKao on 2017/3/12.
//  Copyright © 2017年 bike. All rights reserved.
//

#import "PLDavincciMissile.h"

@implementation PLDavincciMissile

- (NSInteger)powerCost
{
    return 1;
}

- (NSString *)missileName
{
    return @"Davincci";
}

- (NSInteger)speed {
    return 40.f;
}

@end
