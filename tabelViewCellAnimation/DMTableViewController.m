//
//  DMTableViewController.m
//  tabelViewCellAnimation
//
//  Created by david on 15/7/7.
//  Copyright (c) 2015年 杜蒙. All rights reserved.
//

#import "DMTableViewController.h"

@interface DMTableViewController ()

@property (nonatomic,strong)NSArray *cellArray;

@end

@implementation DMTableViewController



- (void)viewDidLoad{
    [self.tableView reloadData];
    self.cellArray = self.tableView.visibleCells;
    
    //  延迟
    CGFloat delay =0.05;
    for (UITableViewCell *cell in self.cellArray) {
        cell.transform = CGAffineTransformMakeTranslation(self.view.bounds.size.width, 0);
    }
    
    for (int i = 0; i<self.cellArray.count; i++) {
        UITableViewCell *cell = self.cellArray[i];
        CGFloat cellDelay = delay *i;
        
        [UIView animateWithDuration:1.0 delay:cellDelay usingSpringWithDamping:0.5 initialSpringVelocity:10 options:UIViewAnimationOptionCurveEaseIn animations:^{
            cell.transform = CGAffineTransformMakeTranslation(0, 0);
        } completion:^(BOOL finished) {
            
        }];
    }
}







- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 99;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    if (cell == nil) {
        cell = [tableView dequeueReusableCellWithIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"this is %ld",indexPath.row];
    
    
    return cell;
    
    
}

@end
