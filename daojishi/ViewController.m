//
//  ViewController.m
//  daojishi
//
//  Created by Kevin on 2017/7/10.
//  Copyright © 2017年 Kevin. All rights reserved.
//

#import "ViewController.h"
#import "TimeModel.h"
#import "TimeCell.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface ViewController ()

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataSource;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    
    @weakify(self);
    //开启一个定时器
    [[RACSignal interval:1 onScheduler:[RACScheduler scheduler]] subscribeNext:^(id x) {
        
        NSLog(@"%@",[NSThread currentThread]); 
        
        static NSInteger time = 10000;
        time--;
        @strongify(self);
        
        for (TimeModel *model in self.dataSource) {
            //进行model操作，改变model属性的值
            model.timeString = [NSString stringWithFormat:@"%02ld:%02ld:%02ld",time/60/20,time/60%60,time%60];
        }
    }];
    
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [TimeCell cellWithTableView:tableView indexPath:indexPath model:self.dataSource[indexPath.row]];
}

#pragma mark - 懒加载
- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [self createPlainTableViewWithTop:0 bottom:0];
        _tableView.rowHeight = 100;
    }
    return _tableView;
}

- (NSMutableArray *)dataSource{
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
        for (int i=0; i<50; i++) {
            TimeModel *model = [[TimeModel alloc] init];
            [_dataSource addObject:model];
        }
    }
    return _dataSource;
}


@end
