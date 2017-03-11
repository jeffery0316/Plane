//
//  PLDavincciMissile.m
//  Plane
//
//  Created by JefferyKao on 2017/3/12.
//  Copyright © 2017年 bike. All rights reserved.
//

#import "PLDavincciMissile.h"

@implementation PLDavincciMissile

- (instancetype)initWithPosition:(CGPoint)position
{
    if (self = [super init]) {
        self.position = position;
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
    return 40.f;
}

- (CGPoint)originPosition
{
    return self.position;
}

@end
