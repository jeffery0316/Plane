//
//  PLGameViewController.m
//  Plane
//
//  Created by jefferykao on 2017/3/11.
//  Copyright © 2017年 bike. All rights reserved.
//

#import "PLGameViewController.h"

#import "PLMissileInterface.h"

// view
#import "PlaneView.h"
#import "PLCounterView.h"
#import "PLMissileView.h"
#import "PLMissileColumnButton.h"

// model
#import "PLPlane.h"
#import "PLMissileManager.h"

// setting
#import "PLConfig.h"

@interface PLGameViewController () <PlanViewDelegate>
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
}

- (void)startGame {
    [self initMap];
    [self initPlane];
}

- (void)initMap {

    // fire view
    CGRect fireButtonFrame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 45, [UIScreen mainScreen].bounds.size.height - 100, 90, 90);
    self.fireButton = [[UIButton alloc] initWithFrame:fireButtonFrame];
    [self.fireButton setImage:[UIImage imageNamed:@"fire"] forState:UIControlStateNormal];
    [self.view addSubview:self.fireButton];
    [self.fireButton addTarget:self action:@selector(fireAction:) forControlEvents:UIControlEventTouchUpInside];

    // missile board view
    CGFloat posX = 55;
    NSArray *missiles = @[@(PLMissileTypeDavincci), @(PLMissileTypeBacon), @(PLMissileTypeNewton)];

    for (NSInteger idx = missiles.count - 1; idx >= 0; idx --) {
        CGPoint position = CGPointMake([UIScreen mainScreen].bounds.size.width - posX, 40);
        PLMissileType type = [missiles[idx] integerValue];
        PLMissileColumnButton *columnButton = [[PLMissileColumnButton alloc] init];
        [columnButton configureWithMissileType:type position:position];
        [columnButton addTarget:self action:@selector(selectMissileAction:) forControlEvents:UIControlEventTouchUpInside];
        columnButton.tag = type;
        [self.view addSubview:columnButton];
        posX = posX + 55;
    }

    // counter view
    PLCounterView *counter = [[PLCounterView alloc] init];
    [self.view addSubview:counter];
}

- (void)initPlane {
    CGFloat defaultPlaneX = [UIScreen mainScreen].bounds.size.width / 2;
    CGFloat defaultPlaneY = [UIScreen mainScreen].bounds.size.height;
    PLPlane *plane = [[PLPlane alloc] initWithPosition:CGPointMake(defaultPlaneX, defaultPlaneY)];
    [PLConfig sharedConfig].plane = plane;
    PlaneView *planeView = [[PlaneView alloc] initWithPlane:plane];
    planeView.delegate = self;
    [self.view addSubview:planeView];
}

#pragma mark - Action methods
- (void)startAction:(UIButton *)button
{
    // clear map
    self.prepareView.hidden = YES;

    // init game
    [self startGame];
}

- (void)selectMissileAction:(UIButton *)button
{
    // TODO: refactor and abstract this part as a PLMissileManager
    // change missile
    switch (button.tag) {
        case PLMissileTypeDavincci: {
            [PLConfig sharedConfig].plane.missile = [[PLDavincciMissile alloc] init];
            break;
        }
        case PLMissileTypeBacon: {
            [PLConfig sharedConfig].plane.missile = [[PLBaconMissile alloc] init];
            break;
        }
        case PLMissileTypeNewton: {
            [PLConfig sharedConfig].plane.missile = [[PLNewtonMissile alloc] init];
            break;
        }
        default:
            break;
    }
}

- (void)fireAction:(UIButton *)button
{
    // cost the power
    if (([PLConfig sharedConfig].score - [PLConfig sharedConfig].plane.missile.powerCost) < 0) {
        return;
    }

    [PLConfig sharedConfig].score = [PLConfig sharedConfig].score - [PLConfig sharedConfig].plane.missile.powerCost;
    [[NSNotificationCenter defaultCenter] postNotificationName:PLScoreChangedNotification object:nil];

    // move missile
    PLMissileView *missileView = [[PLMissileView alloc] init];
    id <PLMissileInterface> missile = [PLConfig sharedConfig].plane.missile;
    [missileView configureWithMissile:missile];
    [self.view addSubview:missileView];
    [missileView addAnimation];
}

#pragma mark - PlanViewDelegate methods
- (void)planeView:(PlaneView *)plaveView didUpdatePosition:(CGPoint)position
{
    [PLConfig sharedConfig].plane.position = position;
}

@end
