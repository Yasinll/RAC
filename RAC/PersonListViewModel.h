//
//  PersonListViewModel.h
//  RAC
//
//  Created by PatrickY on 2017/12/22.
//  Copyright © 2017年 PatrickY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

//数据模型
@interface PersonListViewModel : NSObject

//联系人
@property (nonatomic) NSMutableArray <Person *> *personList;


- (void)loadPersonList;

@end


