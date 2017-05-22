//
//  ViewController.m
//  SwizzleProject
//
//  Created by CHT-Technology on 2017/4/25.
//  Copyright © 2017年 CHT-Technology. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addCrashCode];
    
}

- (void)addCrashCode{
    
    //test Array
    id obj = nil;
    NSArray *array = @[@"1",@"2",@"3",obj,@"5"];
    id value1 = [array objectAtIndex:99];
    id value2 = array[100];
    NSLog(@"\n value1==%@ \n value2==%@ \n newArray==%@",value1,value2,[array arrayByAddingObject:nil]);
    
    NSMutableArray *mArray = [NSMutableArray arrayWithArray:array];
    [mArray addObject:nil];
    [mArray insertObject:nil  atIndex:10];
    [mArray removeObjectAtIndex:10];
    [mArray replaceObjectAtIndex:10 withObject:nil];
    NSLog(@"mArray === %@ %@",mArray,mArray[100]);
    
    //dic
    NSDictionary *dic = @{@"a":@"1",
                          @"b":@"2",
                          @"c":obj,
                          @"d":@"4"};
    NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithDictionary:dic];
    [mDic setDictionary:nil];
    [mDic removeObjectForKey:@"e"];
    [mDic setObject:obj forKey:@"e"];
    [mDic setObject:@"e" forKey:obj];
    
    //str
    NSString *str = @"abcd";
    NSLog(@"==%f",[str rangeOfString:nil]);
    NSLog(@"==%hu",[str characterAtIndex:5]);
    NSLog(@"==%@",[str substringWithRange:NSMakeRange(0, 100)]);
    NSLog(@"==%@",[str substringFromIndex:10]);
    NSLog(@"==%@",[str substringToIndex:10]);
    
    NSMutableString *mStr = [[NSMutableString alloc]initWithString:str];
    [mStr replaceCharactersInRange:NSMakeRange(0, 100) withString:nil];
    [mStr insertString:@"1" atIndex:100];
    [mStr deleteCharactersInRange:NSMakeRange(10, 100)];
    [mStr appendString:nil];
    [mStr setString:nil];
    NSLog(@"mStr===%@",mStr);
    
    UITextView *tx = [UITextView new];
    [self.view addSubview:tx];
    
    [tx becomeFirstResponder];
    
//    NSAttributedString
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
