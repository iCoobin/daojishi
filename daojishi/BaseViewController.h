//
//  BaseViewController.h
//  daojishi
//
//  Created by Kevin on 2017/7/10.
//  Copyright © 2017年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
<UITableViewDelegate,UITableViewDataSource>

/**
 创建TableView
 
 @param top 上偏移
 @param bottom 下偏移
 @return tableview
 */
- (UITableView *)createPlainTableViewWithTop:(CGFloat)top bottom:(CGFloat)bottom;
- (UITableView *)createGroupedTableViewWithTop:(CGFloat)top bottom:(CGFloat)bottom;

@end

