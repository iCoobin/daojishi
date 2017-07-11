//
//  TimeCell.m
//  daojishi
//
//  Created by Kevin on 2017/7/10.
//  Copyright © 2017年 Kevin. All rights reserved.
//

#import "TimeCell.h"
#import "TimeModel.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface TimeCell ()

@property (nonatomic,strong) UILabel *timeLabel;
@property (nonatomic,strong) RACDisposable *timeDisposable;

@end

@implementation TimeCell


- (void)makeSubViews{
    
    _timeLabel = [[UILabel alloc] init];
    _timeLabel.font = [UIFont systemFontOfSize:17];
    _timeLabel.frame = CGRectMake(30, 30, 150, 50);
    
    [self.contentView addSubview:_timeLabel];
}

- (void)refreshUI:(TimeModel *)viewModel{
    
    //取消订阅
    if (_timeDisposable) {
        [_timeDisposable dispose];
    }
    
    //添加订阅
    @weakify(self);
    self.timeDisposable = [RACObserve(viewModel, timeString) subscribeNext:^(id  _Nullable x) {
        dispatch_async(dispatch_get_main_queue(), ^{
            @strongify(self);
            self.timeLabel.text = x;
        });
    }];
}


@end
