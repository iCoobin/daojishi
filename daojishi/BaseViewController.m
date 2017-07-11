//
//  BaseViewController.m
//  daojishi
//
//  Created by Kevin on 2017/7/10.
//  Copyright © 2017年 Kevin. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

-(void)dealloc{
    NSLog(@"%@ dealloc",NSStringFromClass([self class]));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //view置顶
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    //解决首个scrollView引发的偏移
    [self.view addSubview:[UIScrollView new]];
}


- (UITableView *)createPlainTableViewWithTop:(CGFloat)top bottom:(CGFloat)bottom{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = [UIColor clearColor];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    tableView.contentInset = UIEdgeInsetsMake(top, 0, bottom, 0);
    tableView.scrollIndicatorInsets = UIEdgeInsetsMake(top, 0, bottom, 0);
    return tableView;
}

- (UITableView *)createGroupedTableViewWithTop:(CGFloat)top bottom:(CGFloat)bottom{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = [UIColor clearColor];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    tableView.contentInset = UIEdgeInsetsMake(top, 0, bottom, 0);
    tableView.scrollIndicatorInsets = UIEdgeInsetsMake(top, 0, bottom, 0);
    return tableView;
}

#pragma mark - UITableViewDataSource | UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [[UIImageView alloc] initWithImage:[UIImage new]];
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [[UIImageView alloc] initWithImage:[UIImage new]];
}

@end
