//
//  RACViewController.m
//  MVVMDemo
//
//  Created by txooo on 2019/7/10.
//  Copyright © 2019 txooo. All rights reserved.
//

#import "RACViewController.h"
#import "RACViewModel.h"
#import "RACTableViewCell.h"

@interface RACViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) RACViewModel *viewModel;

@end

@implementation RACViewController

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        [_tableView registerClass:[RACTableViewCell class] forCellReuseIdentifier:@"cellID"];
    }
    return _tableView;
}

- (RACViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[RACViewModel alloc] init];
    }
    return _viewModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"MVVM+RAC";
    
    [self.view addSubview:self.tableView];
    
    [self requestData];
}

- (void)requestData {
    @weakify(self);
    // executionSignals 冷信号， 需提前订阅
    [[self.viewModel.requestCommand.executionSignals switchToLatest] subscribeNext:^(id x) {
        NSLog(@"收到信号");
        @strongify(self);
        [self.tableView reloadData];
    }];
    
    [self.viewModel.requestCommand execute:nil];
    
    [self.viewModel.requestCommand.errors subscribeNext:^(NSError *error) {
        NSLog(@"收到错误");
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cellID";
    RACTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    cell.model = self.viewModel.datas[indexPath.row];
    return cell;
}

@end
