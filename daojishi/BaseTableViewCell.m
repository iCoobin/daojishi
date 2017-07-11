//
//  BaseTableViewCell.m
//  daojishi
//
//  Created by Kevin on 2017/7/10.
//  Copyright © 2017年 Kevin. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

@synthesize indexPath = _indexPath;
@synthesize model = _model;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self makeSubViews];
        [self addEvent];
    }
    return self;
}

- (void)setModel:(id)viewModel{
    _model = viewModel;
    [self refreshUI:viewModel];
    [self layoutConstraint:viewModel];
}

- (void)makeSubViews{
    
    
}

- (void)addEvent{
    
    
}

- (void)refreshUI:(id)viewModel{
    
}

- (void)layoutConstraint:(id)viewModel{
    
}

+ (id)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath*)indexPath{
    return [self cellWithTableView:tableView indexPath:indexPath model:nil];
}

+ (id)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath*)indexPath model:(id)model{
    return [self cellWithTableView:tableView indexPath:indexPath model:model delegate:nil];
}

+ (id)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath*)indexPath model:(id)model delegate:(id)delegate{
    [tableView registerClass:self forCellReuseIdentifier:NSStringFromClass(self)];
    BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self) forIndexPath:indexPath];
    [cell setIndexPath:indexPath];
    [cell setModel:model];
    cell.delegate = delegate;
    cell.tableView = tableView;
    return cell;
}

@end
