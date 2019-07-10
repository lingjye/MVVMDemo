//
//  MVVMViewController.m
//  MVVMDemo
//
//  Created by txooo on 2019/7/10.
//  Copyright © 2019 txooo. All rights reserved.
//

#import "MVVMViewController.h"
#import "MVVMViewModel.h"
#import "MVVMTableViewCell.h"

@interface MVVMViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) MVVMViewModel *viewModel;

@end

@implementation MVVMViewController

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        [_tableView registerClass:[MVVMTableViewCell class] forCellReuseIdentifier:@"cellID"];
    }
    return _tableView;
}

- (MVVMViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[MVVMViewModel alloc] init];
    }
    return _viewModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"MVVM";
    
    [self.view addSubview:self.tableView];
    
    [self requestData];
}

- (void)requestData {
    __weak typeof(self) weakSelf = self;
    [self.viewModel requestDatas:^(NSError * _Nullable error) {
        if (error) {
            // show error
        }
        [weakSelf.tableView reloadData];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cellID";
    MVVMTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    cell.model = self.viewModel.datas[indexPath.row];
    return cell;
}


@end
