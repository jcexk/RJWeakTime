# RJWeakTime
RJWeakTimer is a NSTimer that can be automatically released, so you don’t need to worry about NSTimer memory leaks.
# 设计思路如图
<img width="854" alt="image" src="https://user-images.githubusercontent.com/28210342/113327842-02e18b80-934e-11eb-9833-23324dd1bbb7.png">

# usage

    self.timer = [RJWeakTime scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(cb:) userInfo:@{@"key":@"test"} repeats:YES];

