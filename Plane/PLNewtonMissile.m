//
//  PLNewtonMissile.m
//  Plane
//
//  Created by JefferyKao on 2017/3/12.
//  Copyright © 2017年 bike. All rights reserved.
//

#import "PLNewtonMissile.h"

@implementation PLNewtonMissile
- (NSInteger)powerCost
{
    return 3;
}

- (NSString *)missileName
{
    return @"Newton";
}

- (NSInteger)speed {
    return 90.f;
}
@end
