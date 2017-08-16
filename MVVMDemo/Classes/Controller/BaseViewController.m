//
//  BaseViewController.m
//  MVVMDemo
//
//  Created by txooo on 17/8/14.
//  Copyright © 2017年 txooo. All rights reserved.
//

#import "BaseViewController.h"

#import "Router.h"

@interface BaseViewController ()

@property (nonatomic,strong) NSDictionary *params;

@end

@implementation BaseViewController

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    BaseViewController *viewController = [super allocWithZone:zone];
    
    @weakify(viewController)
    [[viewController
      rac_signalForSelector:@selector(viewDidLoad)]
     subscribeNext:^(id x) {
         @strongify(viewController)
         [viewController bindViewModel];
     }];
    
    return viewController;
}

- (BaseViewController *)initWithViewModel:(id)viewModel {
    self = [super init];
    if (self) {
        self.viewModel = viewModel;
    }
    return self;
}

- (instancetype)initWithParams:(NSDictionary *)params {
    self = [super init];
    if (self) {
        self.params = params;
        self.viewModel = [[Router sharedInstance] viewModelForViewController:self];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)bindViewModel {
    RAC(self, title) = RACObserve(self.viewModel, title);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.viewModel.didSelectCommand execute:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.viewModel.willDisappearSignal sendNext:nil];
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return  UIInterfaceOrientationMaskPortrait;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

@implementation UIViewController (Additions)

- (void)dealloc {
    NSLog(@"%@ dealloc",NSStringFromClass([self class]));
}

- (id)valueForUndefinedKey:(NSString *)key {
    return nil;
}

@end
