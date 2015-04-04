//
//  ZPTableViewCell.m
//  Demo
//
//  Created by 赵鹏 on 15/4/4.
//  Copyright (c) 2015年 赵鹏. All rights reserved.
//

#import "ZPTableViewCell.h"
@interface ZPTableViewCell ()

@property (nonatomic, strong) UIView *snapView;

@end

@implementation ZPTableViewCell


- (void)awakeFromNib {
    _downView.layer.cornerRadius = 4;
    _downView.layer.shadowColor = [UIColor blackColor].CGColor;
    _downView.layer.shadowOffset = CGSizeMake(2, 2);
    _downView.layer.shadowOpacity = 0.5;
    _downView.layer.shadowRadius = 5;
    //添加一个长安手势
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressGesture:)];
    //将长按手势添加到cell容器里
    [self.contentView addGestureRecognizer:longPress];
}
//实现长按手势事件响应
- (void)longPressGesture:(UILongPressGestureRecognizer *)gesture
{
    CGPoint startPoint = CGPointZero;//初始点
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
        {
            _snapView = [_upView snapshotViewAfterScreenUpdates:NO];
            //获得当前触摸点
            startPoint = [gesture locationInView:self.contentView];
            //设置锚点
            _snapView.layer.anchorPoint = CGPointMake(startPoint.x/_snapView.layer.frame.size.width - 0.1, startPoint.y/_snapView.layer.frame.size.height - 0.1);
            _snapView.frame = _upView.frame;
            _snapView.transform = CGAffineTransformMakeRotation(M_PI/30);
            [self.contentView addSubview:_snapView];
            self.upView.hidden = YES;
            self.downView.hidden = YES;
            break;
        }
        case UIGestureRecognizerStateChanged:
        {
            CGPoint changePoint = [gesture locationInView:self.contentView];
            [UIView animateWithDuration:0.06 animations:^{
                _snapView.layer.position = changePoint;
            }];
            break;
        }
        case UIGestureRecognizerStateEnded:
        {
            CGPoint endPoint = [gesture locationInView:self.contentView];
            if (endPoint.x > self.contentView.bounds.size.width*0.5) {
                if (self.cellBlaock) {
                    self.cellBlaock(YES,_cellPath);
                }
            }else{
                if (self.cellBlaock) {
                    self.cellBlaock(NO,_cellPath);
                }
            }
            [_snapView removeFromSuperview];
            self.upView.hidden = NO;
            self.downView.hidden = NO;
            break;
        }
        default:
            break;
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
















