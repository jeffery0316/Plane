//
//  PLMissileView.m
//  Plane
//
//  Created by JefferyKao on 2017/3/11.
//  Copyright © 2017年 bike. All rights reserved.
//

#import "PLMissileView.h"

static NSString * const kAnimationRemoveLayerKey = @"animationRemoveLayer";
static CGFloat const kMissileWidth = 18;
static CGFloat const kMissileHeight = 40;

@interface PLMissileView () <CAAnimationDelegate>
@property (strong, nonatomic) CABasicAnimation *animation;
@property (strong, nonatomic) UIImageView *missileImageView;
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
    self.animation.toValue = [NSValue valueWithCGPoint:CGPointMake(self.frame.origin.x, 20)];
    self.animation.duration = 5.0f;
    self.animation.delegate = self;
    self.animation.repeatCount = 0;
    self.animation.removedOnCompletion = NO;
    self.animation.fillMode = kCAFillModeForwards;
    self.animation.autoreverses = NO;
    [self.layer addAnimation:self.animation forKey:@"launch"];
}

- (void)configureWithMissile:(id <PLMissileInterface>)missile
{
    
}

- (void)animationDidStop:(CAAnimation *)anim
                finished:(BOOL)flag
{
    CALayer *lay = [self valueForKey:kAnimationRemoveLayerKey];
    if(lay){
        [lay removeAllAnimations];
        [lay removeFromSuperlayer];
    }
}

@end
