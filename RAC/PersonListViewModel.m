//
//  PersonListViewModel.m
//  RAC
//
//  Created by PatrickY on 2017/12/22.
//  Copyright © 2017年 PatrickY. All rights reserved.
//

#import "PersonListViewModel.h"

@implementation PersonListViewModel


- (RACSignal *)loadPersonList {
    
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
     
        
        _personList = [NSMutableArray array];
        //异步加载数据
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            
            [NSThread sleepForTimeInterval:1.0];
            
            for (NSInteger i = 0; i < 20; i++) {
                
                Person *p = [[Person alloc] init];
                
                p.name = [@"zhansan - " stringByAppendingFormat:@"%zd", i];
                p.age = 15 + arc4random_uniform(20);
                
                [_personList addObject:p];
                
            }
            
            //完成回调
            dispatch_async(dispatch_get_main_queue(), ^{
               
                //发送信号
                BOOL isError = NO;
                
                if (isError) {
                    [subscriber sendError:[NSError errorWithDomain:@"123" code:1001 userInfo:@{@"error message": @"异常"}]];
                }else {
                    
                    [subscriber sendNext:self];
                    
                }
                
                [subscriber sendCompleted];
                
            });
            
        });
        
        return nil;
    }];
    
}

@end
