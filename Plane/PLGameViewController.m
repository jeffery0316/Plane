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
#import "PLMissileView.h"
#import "PLMissileColumnView.h"

// model
#import "PLPlane.h"
#import "PLMissileManager.h"

// setting
#import "PLConfig.h"

@interface PLGameViewController ()
@property (weak, nonatomic) IBOutlet UIView *prepareView;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (strong, nonatomic) UIButton *fireButton;
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
    CGRect fireButtonFrame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 45, [UIScreen mainScreen].bounds.size.height - 100, 90, 90);
    self.fireButton = [[UIButton alloc] initWithFrame:fireButtonFrame];
    [self.fireButton setImage:[UIImage imageNamed:@"fire"] forState:UIControlStateNormal];
    [self.view addSubview:self.fireButton];
    [self.fireButton addTarget:self action:@selector(fireAction:) forControlEvents:UIControlEventTouchUpInside];

    // add missile board view
    CGFloat posX = 55;
    NSArray *missiles = @[@(PLMissileTypeDavincci), @(PLMissileTypeBacon), @(PLMissileTypeNewton)];

    for (NSInteger idx = missiles.count - 1; idx >= 0; idx --) {
        CGPoint position = CGPointMake([UIScreen mainScreen].bounds.size.width - posX, 0);
        PLMissileType type = [missiles[idx] integerValue];
        PLMissileColumnView *columnView = [[PLMissileColumnView alloc] init];
        [columnView configureWithMissileType:type position:position];
        [columnView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectMissileAction:)]];
        [self.view addSubview:columnView];
        posX = posX + 55;
    }

    // add bullet count view
    //    UILabel *bulletLabel = [UILabel alloc] initWithFrame:
}

- (void)initPlane {
    CGFloat defaultPlaneX = [UIScreen mainScreen].bounds.size.width / 2;
    CGFloat defaultPlaneY = [UIScreen mainScreen].bounds.size.height;
    PLPlane *plane = [[PLPlane alloc] initWithPosition:CGPointMake(defaultPlaneX, defaultPlaneY)];
    [PLConfig sharedConfig].plane = plane;
    PlaneView *planeView = [[PlaneView alloc] initWithPlane:plane];
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

- (void)selectMissileAction:(UIButton *)button
{
    // change missile
    
}

- (void)fireAction:(UIButton *)button
{
    // cost the power

    // move missile
    
    PLMissileView *missileView = [[PLMissileView alloc] init];
    [missileView configureWithMissile:missile];
    [missileView addAnimation];
    
    UIImageView *missile = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"missile1"]];
    missile.frame = CGRectMake([PLConfig sharedConfig].plane.position.x, [PLConfig sharedConfig].plane.position.y, 18, 40);
    missile.center = [PLConfig sharedConfig].plane.position;
    [self.view addSubview:missile];
}

@end
