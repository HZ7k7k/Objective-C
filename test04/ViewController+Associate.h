//
//  ViewController+Associate.h
//  test04
//
//  Created by hanzhen on 2019/6/18.
//  Copyright © 2019 hanzhen. All rights reserved.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@protocol VCDelegate <NSObject>
- (void)Delegate_print;
@end

@interface ViewController (Associate)<VCDelegate>
@property(nonatomic, assign)int count;
@property(nonatomic, assign)int num;
- (void)testNum;
@end

NS_ASSUME_NONNULL_END
