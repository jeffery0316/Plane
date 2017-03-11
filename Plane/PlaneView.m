//
//  PlaneView.m
//  PlaneView
//
//  Created by JefferyKao on 2017/3/11.
//  Copyright © 2017年 bike. All rights reserved.
//

#import "PlaneView.h"

static CGFloat const planeWidth = 80;
static CGFloat const planeHeight = 100;

@interface PlaneView ()
@property (assign, nonatomic) CGFloat posX;
@property (assign, nonatomic) CGFloat posY;

@property (assign, nonatomic) BOOL isDragging;
@property (assign, nonatomic) CGFloat oldX;
@property (assign, nonatomic) CGFloat oldY;
@end

@implementation PlaneView

- (instancetype)initWithPlane:(PLPlane *)plane position:(CGPoint)position {
    self.posX = position.x - planeWidth / 2;
    self.posY = position.y - planeHeight - 80;
    CGRect frame = CGRectMake(self.posX, self.posY, planeWidth, planeHeight);
    
    if(self = [super initWithFrame:frame]){
        self.backgroundColor = [UIColor clearColor];

        UIView *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil][0];
        view.frame = self.bounds;
        [self addSubview:view];
    }

    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];

    // draggin event
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:self];

    self.isDragging = YES;
    self.oldX = touchLocation.x;
    self.oldY = touchLocation.y;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];

    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:self];

    if (self.isDragging) {
        CGRect frame = self.frame;
        frame.origin.x = self.frame.origin.x + touchLocation.x - self.oldX;
        frame.origin.y =  self.frame.origin.y + touchLocation.y - self.oldY;
        self.frame = frame;
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    self.isDragging = NO;
}
@end
