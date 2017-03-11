//
//  PLGameViewController.m
//  Plane
//
//  Created by jefferykao on 2017/3/11.
//  Copyright © 2017年 bike. All rights reserved.
//

#import "PLGameViewController.h"

// view
#import "PlaneView.h"
#import "PLMissileColumnView.h"

// model
#import "PLPlane.h"
#import "PLMissileManager.h"

// setting
#import "PLConfig.h"

@interface PLGameViewController ()
@property (weak, nonatomic) IBOutlet UIView *prepareView;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@end

@implementation PLGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // setup part
    [self _setupGame];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Setup methods
- (void)_setupGame {
    [self.startButton addTarget:self action:@selector(startAction:) forControlEvents:UIControlEventTouchUpInside];
//    [PLConfig sharedConfig] observeValueForKeyPath:@"" ofObject:<#(nullable id)#> change:<#(nullable NSDictionary<NSKeyValueChangeKey,id> *)#> context:<#(nullable void *)#>
}

- (void)initGame {
    [self initMap];
    [self initPlane];
    [self initMissile];
}

- (void)initMap {
    // add fire view
    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fire"]];
    image.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 45, [UIScreen mainScreen].bounds.size.height - 100, 90, 90);
    [self.view addSubview:image];

    // add missile board view
    CGFloat posX = 55;
    NSArray *missiles = @[@(PLMissileTypeDavincci), @(PLMissileTypeBacon), @(PLMissileTypeNewton)];

    for (NSInteger idx = missiles.count - 1; idx >= 0; idx --) {
        CGPoint position = CGPointMake([UIScreen mainScreen].bounds.size.width - posX, 0);
        PLMissileType type = [missiles[idx] integerValue];
        PLMissileColumnView *columnView = [[PLMissileColumnView alloc] init];
        [columnView configureWithMissileType:type position:position];
        [self.view addSubview:columnView];
        posX = posX + 55;
    }

    // add bullet count view
}

- (void)initPlane {
    CGFloat defaultPlaneX = [UIScreen mainScreen].bounds.size.width / 2;
    CGFloat defaultPlaneY = [UIScreen mainScreen].bounds.size.height;
    PLPlane *plane = [[PLPlane alloc] init];
    PlaneView *planeView = [[PlaneView alloc] initWithPlane:plane position:CGPointMake(defaultPlaneX, defaultPlaneY)];
    [self.view addSubview:planeView];
}

- (void)initMissile {

}

#pragma mark - Action methods
- (void)startAction:(UIButton *)button
{
    // clear map
    self.prepareView.hidden = YES;

    // status: entering game
//    [PLConfig sharedConfig].gameStatus = PLGameStatusInGame;

    // init game
    [self initGame];
}



@end
