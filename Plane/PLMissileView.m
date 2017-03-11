//
//  PLMissileView.m
//  Plane
//
//  Created by JefferyKao on 2017/3/11.
//  Copyright © 2017年 bike. All rights reserved.
//

#import "PLMissileView.h"
#import "PLEnum.h"
#import "PLConfig.h"

static NSString * const kAnimationRemoveLayerKey = @"animationRemoveLayer";
static CGFloat const kMissileWidth = 18;
static CGFloat const kMissileHeight = 40;

@interface PLMissileView () <CAAnimationDelegate>
@property (strong, nonatomic) CABasicAnimation *animation;
@property (strong, nonatomic) UIImageView *missileImageView;
@property (strong, nonatomic) id <PLMissileInterface> missile;
@end

@implementation PLMissileView
- (instancetype)init {
    CGRect frame = CGRectMake(0, 0, kMissileWidth, kMissileHeight);

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

- (void)addAnimation {

    // animation
    self.animation = [CABasicAnimation animationWithKeyPath:@"position"];
    self.animation.toValue = [NSValue valueWithCGPoint:CGPointMake(self.frame.origin.x, -20)];
    self.animation.duration = self.missile.speed;
    self.animation.delegate = self;
    self.animation.repeatCount = 0;
    self.animation.removedOnCompletion = NO;
    self.animation.fillMode = kCAFillModeForwards;
    self.animation.autoreverses = NO;
    [self.layer addAnimation:self.animation forKey:@"launch"];
}

- (void)configureWithMissile:(id <PLMissileInterface>)missile
{
    self.missile = missile;
    CGRect frame = CGRectMake([PLConfig sharedConfig].plane.position.x, [PLConfig sharedConfig].plane.position.y, kMissileWidth, kMissileHeight);
    self.frame = frame;
    NSString *imageName = [PLEnum PLMissileFileTypeToStringWithMissileType:missile.type];
    self.missileImageView.image = [UIImage imageNamed:imageName];
    self.missileImageView.backgroundColor = [UIColor clearColor];
}

- (void)animationDidStop:(CAAnimation *)anim
                finished:(BOOL)flag
{
    // remove missile
}

@end
