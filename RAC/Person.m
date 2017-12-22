//
//  Person.m
//  RAC
//
//  Created by PatrickY on 2017/12/22.
//  Copyright © 2017年 PatrickY. All rights reserved.
//

#import "Person.h"

@implementation Person

- (NSString *)description {
    NSArray *keys = @[@"name",@"age"];
    
    return [self dictionaryWithValuesForKeys:keys].description;
    
}
@end
