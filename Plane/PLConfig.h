//
//  PLConfig.h
//  Plane
//
//  Created by JefferyKao on 2017/3/11.
//  Copyright © 2017年 bike. All rights reserved.
//

@class PLPlane;
@import UIKit;
#import <Mantle/Mantle.h>
#import <Foundation/Foundation.h>
#import "PLEnum.h"
#import "PLPlane.h"

@interface PLConfig : MTLModel <MTLJSONSerializing>
@property (assign, nonatomic) PLGameStatus gameStatus;
@property (assign, nonatomic) NSInteger score;
@property (strong, nonatomic) PLPlane *plane;

+ (instancetype)sharedConfig;
@end
