//
//  ViewController+Associate.m
//  test04
//
//  Created by hanzhen on 2019/6/18.
//  Copyright © 2019 hanzhen. All rights reserved.
//

#import "ViewController+Associate.h"
#import <objc/runtime.h>
@implementation ViewController (Associate)

+ (void)load{
    NSLog(@"分类associate load方法");
}
+ (void)initialize
{
    if (self == [ViewController class]) {
        NSLog(@"分类associate initialize方法");
    }
}
- (void)setCount:(int)count{
    objc_setAssociatedObject(self, @selector(count), @(count), OBJC_ASSOCIATION_ASSIGN);
}
- (int)count{
    return [objc_getAssociatedObject(self, @selector(count)) intValue];
}
- (void)clearAssociateObject {
    objc_removeAssociatedObjects(self);
}

- (void)Delegate_print{
    NSLog(@"分类实现了协议");
}
@end
