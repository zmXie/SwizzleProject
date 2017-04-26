//
//  UIViewController+Swizzle.m
//  SwizzleProject
//
//  Created by CHT-Technology on 2017/4/25.
//  Copyright © 2017年 CHT-Technology. All rights reserved.
//

#import "UIViewController+Swizzle.h"
#import "NSObject+Swizzle.h"

@implementation UIViewController (Swizzle)

+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self zm_swizzleInstanceMethodWithSrcClass:[self class]
                                            srcSel:@selector(viewWillAppear:)
                                       swizzledSel:@selector(zm_ViewWillAppear:)];
        
        [self zm_swizzleInstanceMethodWithSrcClass:[self class]
                                            srcSel:@selector(viewWillDisappear:)
                                       swizzledSel:@selector(zm_ViewWillDisappear:)];
    });
}

/**
 页面出现的时候会进入到这里实现，即使在子类重写了ViewWillAppear:方法，
 那么在调用[super ViewWillAppear:animated]的时候也会进入这里。

 @param animated 动画
 */
- (void)zm_ViewWillAppear:(BOOL)animated{
    //此处调用自己其实就是调用UIViewController的viewWillAppear的原生实现方法。
    [self zm_ViewWillAppear:animated];
    
    //统一添加统计代码
//    self.title.length == 0?:[MobClick beginLogPageView:self.title];
    
}

- (void)zm_ViewWillDisappear:(BOOL)animated{
    [self zm_ViewWillDisappear:animated];
    
//    self.title.length == 0?:[MobClick endLogPageView:self.title];
}

@end
