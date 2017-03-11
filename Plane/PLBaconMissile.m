//
//  PLBaconMissile.m
//  Plane
//
//  Created by JefferyKao on 2017/3/11.
//  Copyright © 2017年 bike. All rights reserved.
//

#import "PLBaconMissile.h"

@implementation PLBaconMissile

- (instancetype)initWithPosition:(CGPoint)position
{
    if (self = [super init]) {
        self.position = position;
    }

    return self;
}


- (NSInteger)powerCost
{
    return 2;
}

- (NSString *)missileName
{
    return @"Bacon";
}

- (NSString *)imageName
{
    return @"missile2";
}

- (NSInteger)speed {
    return 75.f;
}

- (CGPoint)originPosition
{
    return self.position;
}

@end
