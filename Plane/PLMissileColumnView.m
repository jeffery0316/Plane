//
//  PLMissileColumnView.m
//  Plane
//
//  Created by JefferyKao on 2017/3/11.
//  Copyright © 2017年 bike. All rights reserved.
//

#import "PLMissileColumnView.h"
#import "PLMissileInterface.h"

static CGFloat const kColumnWidth = 60;

@interface PLMissileColumnView()
@property (strong, nonatomic) UIImageView *missileImageView;
@property (assign, nonatomic) PLMissileType missileType;
//@property (strong, nonatomic) UIView *innerView;
@end

@implementation PLMissileColumnView

- (instancetype)init {
    CGRect frame = CGRectMake(0, 0, kColumnWidth, kColumnWidth);

    if(self = [super initWithFrame:frame]){
        self.backgroundColor = [UIColor clearColor];
        self.missileImageView = [[UIImageView alloc] initWithFrame:frame];
        [self addSubview:self.missileImageView];
    }

    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)configureWithMissileType:(PLMissileType)type position:(CGPoint)position {
    CGRect frame = CGRectMake(position.x, position.y, kColumnWidth, kColumnWidth);
    self.frame = frame;
    
    NSString *imageName = [PLEnum PLMissileTypeToStringWithMissileType:type];
    self.missileImageView.image = [UIImage imageNamed:imageName];
    self.missileImageView.backgroundColor = [UIColor clearColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];

    // trigger missile selection
    if (self.delegate && [self.delegate respondsToSelector:@selector(missileColumnView:didSelectMissileType:)]) {
        [self.delegate missileColumnView:self didSelectMissileType:self.missileType];
    }
}

@end
