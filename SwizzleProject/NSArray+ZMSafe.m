//
//  NSArray+ZMSafe.m
//  SwizzleProject
//
//  Created by CHT-Technology on 2017/4/25.
//  Copyright © 2017年 CHT-Technology. All rights reserved.
//

#import "NSArray+ZMSafe.h"
#import "NSObject+Swizzle.h"

@implementation NSArray (ZMSafe)
static NSString *KArrayClass = @"__NSArrayI";
static NSString *KArrayInitClass = @"__NSPlaceholderArray";

+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [self zm_swizzleInstanceMethodWithSrcClass:NSClassFromString(KArrayInitClass)
                                            srcSel:@selector(initWithObjects:count:)
                                       swizzledSel:@selector(zm_safeInitWithObjects:count:)];
        
        [self zm_swizzleInstanceMethodWithSrcClass:NSClassFromString(KArrayClass)
                                            srcSel:@selector(objectAtIndex:)
                                       swizzledSel:@selector(zm_safeObjectAtIndex:)];
        
        [self zm_swizzleInstanceMethodWithSrcClass:NSClassFromString(KArrayClass)
                                            srcSel:@selector(arrayByAddingObject:)
                                       swizzledSel:@selector(zm_safeArrayByAddingObject:)];
        
    });
}

- (instancetype)zm_safeInitWithObjects:(id *)objects count:(NSUInteger)cnt{
    //当遍历到的object为nil的时候，就按当前的cnt来截取
    NSUInteger actuallyCnt = 0;
    for (NSUInteger i = 0; i < cnt; i++) {
        if (!objects[i]) {
            break;
        }
        actuallyCnt++;
    }
    
    return [self zm_safeInitWithObjects:objects count:actuallyCnt];
}

- (id)zm_safeObjectAtIndex:(NSUInteger)index{
    if (index >= self.count) return nil;
        
    return [self zm_safeObjectAtIndex:index];
}

- (NSArray*)zm_safeArrayByAddingObject:(id)anObject{
    if(!anObject) return self;
    
    return [self zm_safeArrayByAddingObject:anObject];
}


@end
