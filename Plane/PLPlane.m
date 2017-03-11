//
//  PLPlane.m
//  Plane
//
//  Created by JefferyKao on 2017/3/11.
//  Copyright © 2017年 bike. All rights reserved.
//

#import "PLPlane.h"
#import "PLEnum.h"

static CGFloat const planeWidth = 80;
static CGFloat const planeHeight = 100;
static CGFloat const missileMax = 100;

@implementation PLPlane

- (instancetype)initWithPosition:(CGPoint)position {
    if (self = [super init]) {
        CGFloat posX = position.x - planeWidth / 2;
        CGFloat posY = position.y - planeHeight - 100;
        self.position = CGPointMake(posX, posY);
        self.size = CGSizeMake(planeWidth, planeHeight);
        self.missile = [[PLDavincciMissile alloc] init];
    }

    return self;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"missileAmount": @"missileAmount",
             @"position": @"position",
             @"missile": @"missile"
             };
}

- (void)reset {
    self.missileAmount = missileMax;
    self.position = [self resetPosition];
    self.missile = [[PLDavincciMissile alloc] init];
}

- (CGPoint)resetPosition {
    CGFloat x = ([UIScreen mainScreen].bounds.size.width - planeWidth) / 2;
    CGFloat y = [UIScreen mainScreen].bounds.size.height - 100;
    return CGPointMake(x, y);
}

@end
