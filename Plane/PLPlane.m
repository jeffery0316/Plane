//
//  PLPlane.m
//  Plane
//
//  Created by JefferyKao on 2017/3/11.
//  Copyright © 2017年 bike. All rights reserved.
//

#import "PLPlane.h"

@implementation PLPlane

- (instancetype)init {
    if (self = [super init]) {
        [self reset];
    }

    return self;
}

- (void)reset {
    self.missileAmount = 100;
}
@end
