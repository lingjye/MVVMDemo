//
//  ViewController.m
//  MVVMDemo
//
//  Created by txooo on 17/8/14.
//  Copyright © 2017年 txooo. All rights reserved.
//

#import "ViewController.h"
#import "MVVMViewController.h"
#import "RACViewController.h"
#import "FirstViewController.h"
#import "BaseViewModelServicesImpl.h"
#import "BaseNavigationControllerStack.h"
#import "FirstViewModel.h"
#import "AppDelegate.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *datas;

@end

@implementation ViewController

- (NSArray *)datas {
    if (!_datas) {
        _datas = @[ @"MVVM", @"MVVM+RAC", @"MVVM+RAC+ViewModel-Based Navigation" ];
    }
    return _datas;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = self.datas[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        MVVMViewController *viewController = [[MVVMViewController alloc] init];
        [self.navigationController pushViewController:viewController animated:YES];
    } else if (indexPath.row == 1) {
        RACViewController *viewController = [[RACViewController alloc] init];
        [self.navigationController pushViewController:viewController animated:YES];
    } else {
        AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        FirstViewModel *viewModel = [[FirstViewModel alloc] initWithServices:delegate.services params:@{@"title":@"First"}];
        FirstViewController *viewController = [[FirstViewController alloc] initWithViewModel:viewModel];
        [self.navigationController pushViewController:viewController animated:YES];
        [delegate.navigationControllerStack pushNavigationController:viewController.navigationController];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
