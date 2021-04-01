//
//  SecondViewController.m
//  RJWeakTime
//
//  Created by 江其 on 2021/3/26.
//

#import "SecondViewController.h"
#import "RJWeakTime.h"
#import <objc/runtime.h>
@interface SecondViewController ()
@property(nonatomic, strong) RJWeakTime *timer;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    self.timer = [RJWeakTime scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(cb:) userInfo:@{@"key":@"test"} repeats:YES];
}

- (void)cb:(NSTimer *)timer {
    NSLog(@"%@",timer.userInfo);
}

- (void)dealloc
{
    NSLog(@"%s>>%s",__FILE__,__func__);
}

@end
