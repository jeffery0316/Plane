//
//  PLNewtonMissile.m
//  Plane
//
//  Created by JefferyKao on 2017/3/12.
//  Copyright © 2017年 bike. All rights reserved.
//

#import "PLNewtonMissile.h"

@implementation PLNewtonMissile

- (instancetype)initWithPosition:(CGPoint)position
{
    if (self = [super init]) {
        self.position = position;
    }

    return self;
}

- (NSInteger)powerCost
{
    return 3;
}

- (NSString *)missileName
{
    return @"Newton";
}

- (NSString *)imageName
{
    return @"missile3";
}

- (NSInteger)speed {
    return 90.f;
}

- (CGPoint)originPosition
{
    return self.position;
}
@end
