//
//  ViewController.m
//  RJWeakTime
//
//  Created by 江其 on 2021/3/26.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import <objc/runtime.h>

@interface ViewController ()
@property(nonatomic, strong) NSString *name;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    self.title = @"首页";
    
    CGFloat width = UIScreen.mainScreen.bounds.size.width;
//    CGFloat height = UIScreen.mainScreen.bounds.size.height;
    UIButton *sender = [[UIButton alloc]initWithFrame:CGRectMake(width/2-50, 250, 100, 100)];
    [self.view addSubview:sender];
    [sender setTitle:@"点我试试" forState:UIControlStateNormal];
    [sender addTarget:self action:@selector(senderClick:) forControlEvents:UIControlEventTouchUpInside];
    sender.backgroundColor = UIColor.redColor;
}

- (void)senderClick:(UIButton *)sender {
    [self.navigationController pushViewController:[SecondViewController new] animated:YES];
}

@end
