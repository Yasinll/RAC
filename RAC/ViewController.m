//
//  ViewController.m
//  RAC
//
//  Created by PatrickY on 2017/12/22.
//  Copyright © 2017年 PatrickY. All rights reserved.
//

#import "ViewController.h"
#import "PersonListViewModel.h"

@interface ViewController ()

@end

@implementation ViewController {
    
    PersonListViewModel *_personListViewModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
    
}


- (void)loadData {
    
    _personListViewModel = [[PersonListViewModel alloc] init];
        
    [_personListViewModel loadPersonList];
        
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
