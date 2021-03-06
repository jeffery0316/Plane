//
//  PLMissileInterface.h
//  Plane
//
//  Created by JefferyKao on 2017/3/12.
//  Copyright © 2017年 bike. All rights reserved.
//

#ifndef PLMissileInterface_h
#define PLMissileInterface_h

@import UIKit;
#import "PLEnum.h"

@protocol PLMissileInterface <NSObject>
- (NSInteger)powerCost;
- (NSString *)missileName;
- (NSString *)imageName;
- (NSInteger)speed;
- (PLMissileType)type;
@end


#endif /* PLMissileInterface_h */
