//
//  BaseViewController.m
//  MVVMDemo
//
//  Created by txooo on 17/8/14.
//  Copyright © 2017年 txooo. All rights reserved.
//

#import "BaseViewController.h"
#import "Router.h"
#import "BaseNavigationViewController.h"

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
         [viewController registViewModelProtocol];
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

- (void)registViewModelProtocol {
    @weakify(self);
    [[self.viewModel rac_signalForSelector:@selector(pushViewModel:animated:)] subscribeNext:^(RACTuple *tuple) {
        @strongify(self);
        UIViewController *viewController = (UIViewController *)[self mapViewControllerForViewModel:tuple.first];
        [self.navigationController pushViewController:viewController animated:[tuple.second boolValue]];
    }];
    
    [[self.viewModel rac_signalForSelector:@selector(popViewModelAnimated:)] subscribeNext:^(RACTuple *tuple) {
        @strongify(self);
        [self.navigationController popViewControllerAnimated:[tuple.first boolValue]];
    }];
    
    [[self.viewModel rac_signalForSelector:@selector(popToRootViewModelAnimated:)] subscribeNext:^(RACTuple *tuple) {
        @strongify(self);
        [self.navigationController popToRootViewControllerAnimated:[tuple.first boolValue]];
    }];
    
    [[self.viewModel rac_signalForSelector:@selector(presentViewModel:animated:completion:)] subscribeNext:^(RACTuple *tuple) {
        @strongify(self);
        UIViewController *viewController = (UIViewController *)[self mapViewControllerForViewModel:tuple.first];
        
        if (![viewController isKindOfClass:UINavigationController.class]) {
            viewController = [[BaseNavigationViewController alloc] initWithRootViewController:viewController];
        }
        
        [self presentViewController:viewController animated:[tuple.second boolValue] completion:tuple.third];
    }];
    
    [[self.viewModel rac_signalForSelector:@selector(dismissViewModelAnimated:completion:)] subscribeNext:^(RACTuple *tuple) {
        @strongify(self);
        [self dismissViewControllerAnimated:[tuple.first boolValue] completion:tuple.second];
    }];
    
}

- (UIViewController *)mapViewControllerForViewModel:(BaseViewModel *)viewModel {
    NSString *viewModelClassString = NSStringFromClass([viewModel class]);
    NSString *viewController = [viewModelClassString stringByReplacingOccurrencesOfString:@"Model" withString:@"Controller"];
    UIViewController *resultViewController = [[NSClassFromString(viewController) alloc] initWithViewModel:viewModel];
    if (![resultViewController isKindOfClass:[BaseViewController class]] && [resultViewController isKindOfClass:[UITableViewController class]]) {
        NSLog(NSLocalizedString(@"未匹配到对应viewModel--->%@", nil),[resultViewController class]);
        return nil;
    }
    return resultViewController;
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
