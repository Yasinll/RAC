//
//  ViewController.m
//  RAC
//
//  Created by PatrickY on 2017/12/22.
//  Copyright © 2017年 PatrickY. All rights reserved.
//

#import "ViewController.h"
#import "PersonListViewModel.h"

NSString *const PTPersonCellIdentifier = @"PTPersonCellIdentifier";

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController {
    
    PersonListViewModel *_personListViewModel;
    UITableView *_tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
    
    [self prepareTableView];
}


//加载数据
- (void)loadData {
    
    _personListViewModel = [[PersonListViewModel alloc] init];
        
    [[_personListViewModel loadPersonList] subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
        
        //刷新表格
        [_tableView reloadData];
        
    } error:^(NSError * _Nullable error) {
        NSLog(@"%@",error);
    } completed:^{
        NSLog(@"OK");
    }];
        
}

- (void)prepareTableView {
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    [self.view addSubview:_tableView];
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:PTPersonCellIdentifier];
}

#pragma mark -- UITableViewDataSource, UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _personListViewModel.personList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:PTPersonCellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = _personListViewModel.personList[indexPath.row].name;
    
    return cell;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
