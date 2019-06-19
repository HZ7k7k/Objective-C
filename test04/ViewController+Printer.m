//
//  ViewController+Printer.m
//  test04
//
//  Created by hanzhen on 2019/6/18.
//  Copyright © 2019 hanzhen. All rights reserved.
//

#import "ViewController+Printer.h"

@implementation ViewController (Printer)

+ (void)load{
    NSLog(@"分类printer load方法");
}
+ (void)initialize
{
    if (self == [ViewController class]) {
        NSLog(@"分类printer initialize方法");
    }
}

+ (void)category_print{
    
    NSLog(@"分类添加类方法");
}

- (void)category_print{
    NSLog(@"分类添加实例方法");
}

- (void)reloadInputViews{
    NSLog(@"分类重写系统方法");
}

@end
