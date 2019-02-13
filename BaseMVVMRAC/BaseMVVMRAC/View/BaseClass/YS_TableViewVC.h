//
//  YS_TableViewVC.h
//  BaseMVVMRAC
//
//  Created by 宋宏康 on 2019/2/13.
//  Copyright © 2019 demo. All rights reserved.
//

#import "YS_ViewController.h"

@interface YS_TableViewVC : YS_ViewController



- (void)reloadData;

- (UITableViewCell *)tableView:(UITableView *)tableView dequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath;

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath withObject:(id)object;@end
