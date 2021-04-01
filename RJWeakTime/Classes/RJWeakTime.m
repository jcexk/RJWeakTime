//
//  RJWeakTime.m
//

#import "RJWeakTime.h"

#pragma mark - ----- NoCycleTarget -----
@interface NoCycleTarget : NSProxy

///利用消息转发机制，转发到 receive 实现
@property(nonatomic, weak) id receiver;

/**
 * 指定初始化构造器
 * source：消息接收源
 */
+ (id)proxyForReceiver:(id)receiver;

+ (instancetype)alloc __attribute__((unavailable("call proxyForReceiver instead")));
@end

@implementation NoCycleTarget

+ (id)proxyForReceiver:(id)receiver {
    NoCycleTarget *instance = [NoCycleTarget alloc];
    instance.receiver = receiver;
    return instance;
}

///方法加签
- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [self.receiver methodSignatureForSelector:sel];
}

///消息转发
- (void)forwardInvocation:(NSInvocation *)invocation {
    if ([self.receiver respondsToSelector:invocation.selector]) {
        [invocation invokeWithTarget:self.receiver];
    }
}
@end

#pragma mark - ----- RJWeakTime -----

@interface RJWeakTime()

@property (nonatomic, strong) NSTimer *timer;
///target
@property(nonatomic, strong) NoCycleTarget *target;
@end

@implementation RJWeakTime
-(void)dealloc
{
    [self.timer invalidate];
    self.timer = nil;
    NSLog(@"RJWeakTime %s，定时器销毁",__func__);
}
+ (RJWeakTime *)timerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo {
    RJWeakTime *mediator = [[RJWeakTime alloc]init];
    mediator.target = [NoCycleTarget proxyForReceiver:aTarget];
    mediator.timer = [NSTimer timerWithTimeInterval:ti target:mediator.target selector:aSelector userInfo:userInfo repeats:yesOrNo];
    return mediator;
}
+ (RJWeakTime *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo {
    RJWeakTime *mediator = [[RJWeakTime alloc]init];
    mediator.target = [NoCycleTarget proxyForReceiver:aTarget];
    mediator.timer = [NSTimer scheduledTimerWithTimeInterval:ti target:mediator.target selector:aSelector userInfo:userInfo repeats:yesOrNo];
    return mediator;
}
- (instancetype)initWithFireDate:(NSDate *)date interval:(NSTimeInterval)ti target:(id)t selector:(SEL)s userInfo:(nullable id)ui repeats:(BOOL)rep {
    self = [super init];
    if (self) {
        self.target = [NoCycleTarget proxyForReceiver:t];
        self.timer = [[NSTimer alloc]initWithFireDate:date interval:ti target:self.target selector:s userInfo:ui repeats:rep];
    }
    return self;
}

@end
