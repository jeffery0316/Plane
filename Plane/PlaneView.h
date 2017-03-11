//
//  PlaneView.h
//  PlaneView
//
//  Created by JefferyKao on 2017/3/11.
//  Copyright © 2017年 bike. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PLPlane.h"

@class PlaneView;
@protocol PlanViewDelegate <NSObject>
- (void)planeView:(PlaneView *)plaveView didUpdatePosition:(CGPoint)position;
@end

@interface PlaneView : UIView
@property (weak, nonatomic) id <PlanViewDelegate> delegate;
- (instancetype)initWithPlane:(PLPlane *)plane;
@end
