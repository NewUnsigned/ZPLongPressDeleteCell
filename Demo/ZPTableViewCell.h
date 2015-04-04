//
//  ZPTableViewCell.h
//  Demo
//
//  Created by 赵鹏 on 15/4/4.
//  Copyright (c) 2015年 赵鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^gestureBlock)(BOOL isDelete,NSIndexPath *index);

@interface ZPTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *downView;
@property (weak, nonatomic) IBOutlet UIView *upView;
@property (weak, nonatomic) IBOutlet UIImageView *upImageView;
@property (nonatomic, strong) NSIndexPath *cellPath;
@property (nonatomic, copy) gestureBlock cellBlaock;
@end
