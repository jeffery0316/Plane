//
//  PLDavincciMissile.h
//  Plane
//
//  Created by JefferyKao on 2017/3/12.
//  Copyright © 2017年 bike. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PLMissileInterface.h"

@interface PLDavincciMissile : NSObject <PLMissileInterface>
@property (assign, nonatomic) CGPoint position;
@end
