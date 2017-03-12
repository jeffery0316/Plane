//
//  PLFireButton.h
//  Plane
//
//  Created by JefferyKao on 2017/3/12.
//  Copyright © 2017年 bike. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PLFireButton;
@protocol PLFireButtonDelegate <NSObject>
- (void)fireButtonDidFireMissile:(PLFireButton *)fireButton;
@end

@interface PLFireButton : UIButton
@property (weak, nonatomic) id <PLFireButtonDelegate> delegate;
@end
