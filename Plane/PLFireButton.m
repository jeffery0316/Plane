//
//  PLFireButton.m
//  Plane
//
//  Created by JefferyKao on 2017/3/12.
//  Copyright © 2017年 bike. All rights reserved.
//

#import "PLFireButton.h"

@implementation PLFireButton

- (instancetype)init {
    CGRect frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 45, [UIScreen mainScreen].bounds.size.height - 100, 90, 90);

    if(self = [super initWithFrame:frame]){
        [self setImage:[UIImage imageNamed:@"fire"] forState:UIControlStateNormal];
        [self addTarget:self action:@selector(fireAction:) forControlEvents:UIControlEventTouchUpInside];
    }

    return self;
}

- (void)fireAction:(UIButton *)button {
    if (self.delegate && [self.delegate respondsToSelector:@selector(fireButtonDidFireMissile:)]) {
        [self.delegate fireButtonDidFireMissile:self];
    }
}

@end
