//
//  ViewController.m
//  Demo
//
//  Created by 赵鹏 on 15/4/4.
//  Copyright (c) 2015年 赵鹏. All rights reserved.
//

#import "ViewController.h"
#import "ZPTableViewCell.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (assign,nonatomic) NSInteger rowCount;


@end

@implementation ViewController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _rowCount;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZPTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Demo_Cell"];
    
    cell.cellPath = indexPath;
    cell.cellBlaock = ^(BOOL isDelete,NSIndexPath *index){
        if (isDelete) {
            [_myTableView beginUpdates];
            _rowCount--;
            [_myTableView deleteRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationRight];
            [_myTableView endUpdates];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [_myTableView reloadData];
            });
        }
        
    };
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200.0;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _rowCount = 20;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
