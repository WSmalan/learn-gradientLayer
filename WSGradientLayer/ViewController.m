//
//  ViewController.m
//  WSGradientLayer
//
//  Created by SongLan on 2017/3/20.
//  Copyright © 2017年 Asong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)test{
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    label.center = self.view.center;
    label.font = [UIFont systemFontOfSize:35];
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"吴松——Asong";
    //这里是label是用来做文字裁剪作用
    [self.view addSubview:label];
    
    CAGradientLayer *gradientLayer1 =  [CAGradientLayer layer];
    gradientLayer1.frame = label.frame;
    CGColorRef red = [UIColor redColor].CGColor;
    CGColorRef purple = [UIColor purpleColor].CGColor;
    CGColorRef yellow = [UIColor yellowColor].CGColor;
    CGColorRef orange = [UIColor orangeColor].CGColor;
    //添加颜色变化，NSArray *colors;是个数组
    [gradientLayer1 setColors:@[(__bridge id)red, (__bridge id)purple, (__bridge id)yellow, (__bridge id)orange]];
    
    //用来划分显示颜色的区间，不设置的话，会是平均值
    [gradientLayer1 setLocations:@[@0.3, @0.6, @0.8, @1.0]];
    //Default: StartPoint ：[.5,0]
    [gradientLayer1 setStartPoint:CGPointMake(0, 0)];
    //Default: EndPoint ：[.5,1]
    [gradientLayer1 setEndPoint:CGPointMake(1, 1)];
    //label作为遮罩层 :简单的理解就是有对象（不透明）的地方就显示下面的内容。
    gradientLayer1.mask = label.layer;
    //因为只要这位mask，label的就是从原来的superView移除了，从新粘到gradientLayer1，所以要重置位置
    label.frame = gradientLayer1.bounds;
    
    [self.view.layer addSublayer:gradientLayer1];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
