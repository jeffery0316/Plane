//
//  PLConfig.m
//  Plane
//
//  Created by JefferyKao on 2017/3/11.
//  Copyright © 2017年 bike. All rights reserved.
//

#import "PLConfig.h"
static NSString * const kPlaneKey = @"kPlane";
static NSString * const kConfigKey = @"kConfig";

@implementation PLConfig

+ (instancetype)sharedConfig {
    static PLConfig *_config;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        if(!_config){
            _config = [[PLConfig alloc] init];
        }
    });
    
    return _config;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"gameStatus": @"gameStatus",
             @"missileMax": @"missileMax",
             @"plane": @"plane"
    };
}

+ (NSValueTransformer *)planeJSONTransformer
{
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[PLPlane class]];
}

- (instancetype)init {
    if(self = [super init]){
        [self reset];
    }
    return self;
}


- (void)reset {
    self.gameStatus = PLGameStatusInPreparation;
    self.missileMax = 100;
    self.plane = [[PLPlane alloc] init];
}

@end
