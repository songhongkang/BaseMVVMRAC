//
//  YS_TableViewVC.m
//  BaseMVVMRAC
//
//  Created by 宋宏康 on 2019/2/13.
//  Copyright © 2019 demo. All rights reserved.
//

#import "YS_TableViewVC.h"
#import <Masonry.h>
#import <ReactiveObjC.h>
#import <UIScrollView+EmptyDataSet.h>
#import "YS_TableViewModel.h"

@interface YS_TableViewVC () <UITableViewDelegate, UITableViewDataSource,DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

@property (nonatomic, strong) YS_TableViewModel *viewModel;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation YS_TableViewVC

- (instancetype)initWithViewModel:(YS_ViewModel *)viewModel
{
    self  = [super initWithViewModel:viewModel];
    if (self == nil)  return nil;

    if ([viewModel shouldRequestRemoteDataOnViewDidLoad]) {
        [[self rac_signalForSelector:@selector(viewDidLoad)] subscribeNext:^(RACTuple * _Nullable x) {
            [self.viewModel.requestRemoteDataCommad execute:@1];
        }];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupui];
    if (@available(iOS 11.0,*)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        
    }
}

- (void)setupui
{
    UITableView *tableView = [[UITableView alloc] init];
    self.tableView = tableView;
 
    
    [[self rac_signalForSelector:@selector(tableView:didSelectRowAtIndexPath:) fromProtocol:@protocol(UITableViewDelegate)] subscribeNext:^(RACTuple * _Nullable x) {
        
        UITableView *tableView = (UITableView *)x[0];
        NSIndexPath *indexPath = (NSIndexPath *)x[1];
        
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
    }];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.emptyDataSetSource = self;
    tableView.emptyDataSetDelegate = self;
    tableView.tableFooterView = [UIView new];
    [self.view addSubview:tableView];
    
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}


#pragma mark - tableViewDelage && tableviewDataSource

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"CellID"];
    }
    cell.textLabel.text = @"songhongkang";
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.viewModel.dataSource ? self.viewModel.dataSource.count : 1;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel.dataSource[section] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.f;
}

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIImage imageNamed:@"tz_orderNullPic"];
}


#pragma mark - DZNEmptyDataSetSource&&DZNEmptyDataSetDelegate
- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView {
    NSString *text = @"你好，我的名字叫辛巴，大草原是我的家！";
    
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont systemFontOfSize:14.0f],
                                 NSForegroundColorAttributeName:[UIColor lightGrayColor],
                                 NSParagraphStyleAttributeName:paragraph
                                 };
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}


- (void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view
{

}
@end
