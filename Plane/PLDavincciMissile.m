//
//  PLDavincciMissile.m
//  Plane
//
//  Created by JefferyKao on 2017/3/12.
//  Copyright © 2017年 bike. All rights reserved.
//

#import "PLDavincciMissile.h"

@implementation PLDavincciMissile

- (instancetype)init
{
    if (self = [super init]) {
        self.type = PLMissileTypeDavincci;
    }

    return self;
}

- (NSInteger)powerCost
{
    return 1;
}

- (NSString *)missileName
{
    return @"Davincci";
}

- (NSString *)imageName
{
    return @"missile1";
}

- (NSInteger)speed {
    return 0.5f;
}

- (PLMissileType)type
{
    return _type;
}

@end
