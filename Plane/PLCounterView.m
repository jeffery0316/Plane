//
//  PLCounterView.m
//  Plane
//
//  Created by JefferyKao on 2017/3/12.
//  Copyright © 2017年 bike. All rights reserved.
//

#import "PLCounterView.h"
#import "PLConfig.h"

@interface PLCounterView()
@property (strong, nonatomic) UILabel *counterLabel;
@end

@implementation PLCounterView

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)init {
    CGRect frame = CGRectMake(20, 40, 80, 40);

    if(self = [super initWithFrame:frame]){
        self.backgroundColor = [UIColor clearColor];

        // board label
        CGRect boardFrame = CGRectMake(20, 0, 120, 40);
        UILabel *bulletLabel = [[UILabel alloc] initWithFrame:boardFrame];
        bulletLabel.textColor = [UIColor whiteColor];
        bulletLabel.text = @"Bullet Count";
        [self addSubview:bulletLabel];

        // counter label
        CGRect counterFrame = CGRectMake(20, 30, 120, 40);
        self.counterLabel = [[UILabel alloc] initWithFrame:counterFrame];
        self.counterLabel.text = [NSString stringWithFormat:@"%ld", (long)[PLConfig sharedConfig].score];
        self.counterLabel.textColor = [UIColor whiteColor];
        self.counterLabel.font = [UIFont fontWithName:@"System" size:20.f];
        [self addSubview:self.counterLabel];
    }

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(scoreChangedAction:) name:PLScoreChangedNotification object:nil];
    return self;
}

- (void)scoreChangedAction:(id)action {
    self.counterLabel.text = [NSString stringWithFormat:@"%ld", (long)[PLConfig sharedConfig].score];
}

@end
