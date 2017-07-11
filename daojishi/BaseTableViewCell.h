//
//  BaseTableViewCell.h
//  daojishi
//
//  Created by Kevin on 2017/7/10.
//  Copyright © 2017年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewCell : UITableViewCell
{
@public
    NSIndexPath     *_indexPath;
    id               _viewModel;
}


@property (nonatomic,strong) NSIndexPath *indexPath;
@property (nonatomic,strong) id           model;
@property (nonatomic,  weak) id           delegate;
@property (nonatomic,  weak) UITableView *tableView;
@property (nonatomic,  weak) NSArray     *modelArray;

//makeCell
+ (id)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath*)indexPath;
+ (id)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath*)indexPath model:(id)viewModel;
+ (id)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath*)indexPath model:(id)viewModel delegate:(id)delegate;

#pragma mark - Need Override

/**
 创建子view
 */
- (void)makeSubViews;

/**
 添加点击事件
 */
- (void)addEvent;

/**
 刷新UI
 
 @param viewModel view模型
 */
- (void)refreshUI:(id)viewModel;


/**
 布局约束
 
 @param viewModel view模型
 */
- (void)layoutConstraint:(id)viewModel;

@end
