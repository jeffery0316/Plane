//
//  PLConfig.h
//  Plane
//
//  Created by JefferyKao on 2017/3/11.
//  Copyright © 2017年 bike. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PLEnum.h"

@interface PLConfig : NSObject
@property (assign, nonatomic) PLGameStatus gameStatus;
@property (assign, nonatomic) NSInteger missileMax;

+ (instancetype)sharedConfig;
@end
