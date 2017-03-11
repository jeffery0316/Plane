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
        // Restore current user if exist
        id data = [[NSUserDefaults standardUserDefaults] objectForKey:kConfigKey];
        if(data) {
            @try {
                _config = [NSKeyedUnarchiver unarchiveObjectWithData:data];
            }
            @catch (NSException *exception) {

            }
        }

        if(!_config){
            _config = [[PLConfig alloc] init];;
            [_config save];
        }
    });
    
    return _config;
}

- (instancetype)init {
    if(self = [super init]){
        [self reset];
    }
    return self;
}


- (void)reset {
    self.gameStatus = PLGameStatusInPreparation;
}

- (void)save {
    [self archive];
}

- (void)archive {
    NSData *saveSelf = [NSKeyedArchiver archivedDataWithRootObject:self];
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:saveSelf forKey:kConfigKey];
}

@end
