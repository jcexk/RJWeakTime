# RJWeakTime
RJWeakTimer是可以自动释放的NSTimer，因此您不必担心NSTimer内存泄漏。
# Design
<img width="854" alt="image" src="https://user-images.githubusercontent.com/28210342/113327842-02e18b80-934e-11eb-9833-23324dd1bbb7.png">

# Install
    pod 'RJWeakTime'
# Usage
    self.timer = [RJWeakTime scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(cb:) userInfo:@{@"key":@"test"} repeats:YES];
# Important
  创建的RJWeakTime实例对象需要用    `strong`    类型的属性或者成员变量来定义
