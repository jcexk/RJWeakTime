//
//  NoCycleTimer.h


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RJWeakTime : NSObject

@property (nonatomic, readonly, strong) NSTimer *timer;

+ (instancetype)timerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo;
+ (instancetype)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo;
- (instancetype)initWithFireDate:(NSDate *)date interval:(NSTimeInterval)ti target:(id)t selector:(SEL)s userInfo:(nullable id)ui repeats:(BOOL)rep;

@end

NS_ASSUME_NONNULL_END
