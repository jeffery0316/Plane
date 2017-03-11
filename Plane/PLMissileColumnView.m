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
@end

@implementation PLMissileColumnView

- (instancetype)init {
    CGRect frame = CGRectMake(0, 40, kColumnWidth, kColumnWidth);

    if(self = [super initWithFrame:frame]){
        self.backgroundColor = [UIColor clearColor];
        UIView *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil][0];
        view.frame = self.bounds;
        self.missileImageView = [[UIImageView alloc] initWithFrame:frame];
        [view addSubview:self.missileImageView];
        [self addSubview:view];
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
