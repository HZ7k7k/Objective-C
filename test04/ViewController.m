//
//  ViewController.m
//  test04
//
//  Created by hanzhen on 2019/6/18.
//  Copyright © 2019 hanzhen. All rights reserved.
//

#import "ViewController.h"
#import "ViewController+Printer.h"
#import "ViewController+Associate.h"

@interface ViewController ()
@property(nonatomic, assign)int num;
- (void)testNum;
@end

@implementation ViewController

+ (void)load{
    NSLog(@"主类load方法");
}
+ (void)initialize
{
    if (self == [ViewController class]) {
        NSLog(@"主类initialize");
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [ViewController category_print];
    [self category_print];
    [self reloadInputViews];
    [self Delegate_print];

    self.num = 100;
    NSLog(@"%d", self.num);
    self.count = 100;
    NSLog(@"%d", self.count);
}

- (void)testNum{
    NSLog(@"分类公开私有方法");
}
@end
