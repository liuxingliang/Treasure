//
//  XlRewardLuckView.m
//  SwapCenter
//
//  Created by liuxiangliang on 2018/9/13.
//  Copyright © 2018年 zhiyiLiu. All rights reserved.
//

#import "XLRewardLuckView.h"
#import "XLButtonImageView.h"



//#import "XLRewardPlayPrizeModel.h"
//#import "XLRewardNumberNewsModel.h"

@interface XLRewardLuckView()

@property(strong,atomic)XLButtonImageView *button1;
@property(strong,atomic)XLButtonImageView *button2;
@property(strong,atomic)XLButtonImageView *button3;
@property(strong,atomic)XLButtonImageView *button4;
@property(strong,atomic)XLButtonImageView *button5;
@property(strong,atomic)XLButtonImageView *button6;
@property(strong,atomic)XLButtonImageView *button7;
@property(strong,atomic)XLButtonImageView *button8;
@property(strong,atomic)XLButtonImageView *button9;
@property(strong,atomic)XLButtonImageView *button10;
@property(strong,atomic)XLButtonImageView *button11;
@property(strong,atomic)XLButtonImageView *button12;

/**
 *   1.
 **/
@property (nonatomic,strong)UIImageView *iconView;


/**
 *   1.
 **/
@property (nonatomic,strong)NSMutableArray *buttonArray;

/**
 *   1.
 **/
@property (nonatomic,assign)int stopCount;
@property (strong, nonatomic) UIButton * startBtn;
@property (assign, nonatomic) CGFloat time;
@property (assign,nonatomic)XLButtonImageView *temp; // 循环的上个按钮
/**
 *   1.
 **/
@property (nonatomic,assign)int stopTime;
/**
 *   1.
 **/
@property (nonatomic,strong)NSTimer *startTimer;
/**
 *   1.
 **/
@property (nonatomic,assign) int currentTime;

/**
 *   1.
 **/
@property (nonatomic,assign)NSInteger countNumber;

/**
 *   1.中奖结果数组
 **/
@property (nonatomic,strong)NSMutableArray *mutArray;
/**
 *   1.转动的时间
 **/
@property (nonatomic,assign)CGFloat moveTime;
/**
 *   1.
 **/
@property (nonatomic,strong)NSMutableArray *titleArray;
@end
@implementation XLRewardLuckView
-(NSMutableArray *)titleArray{
    if (!_titleArray) {
        _titleArray=[NSMutableArray array];
    }
    return _titleArray;
}
-(NSMutableArray *)mutArray{
    if (!_mutArray) {
        _mutArray=[NSMutableArray array];
    }
    return _mutArray;
}
-(NSMutableArray *)buttonArray{
    if (!_buttonArray) {
        _buttonArray=[NSMutableArray array];
    }
    return _buttonArray;
}
//1.初始化方法
-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self setupView];
    }
    return self;
}

//2.添加子控件
-(void)setupView{
    
    CGFloat  magin=5;
    CGFloat buttonWH=((ScreeWidth-30)-magin*3)/4;
    
    
    self.button1=[self buttonWithTitle:@"1" tag:1];
    self.button1.frame=CGRectMake(0, 0, buttonWH, buttonWH);
    
    self.button2=[self buttonWithTitle:@"2" tag:2];
    self.button2.frame=CGRectMake((buttonWH+magin)*1, 0, buttonWH, buttonWH);
    
    self.button3=[self buttonWithTitle:@"3" tag:3];
    self.button3.frame=CGRectMake((buttonWH+magin)*2, 0, buttonWH, buttonWH);
    
    self.button4=[self buttonWithTitle:@"4" tag:4];
    self.button4.frame=CGRectMake((buttonWH+magin)*3, 0, buttonWH, buttonWH);
    
    self.button5=[self buttonWithTitle:@"5" tag:5];
    self.button5.frame=CGRectMake((buttonWH+magin)*3, (buttonWH+magin)*1, buttonWH, buttonWH);
    
    self.button6=[self buttonWithTitle:@"6" tag:6];
    self.button6.frame=CGRectMake((buttonWH+magin)*3, (buttonWH+magin)*2, buttonWH, buttonWH);
    
    self.button7=[self buttonWithTitle:@"7" tag:7];
    self.button7.frame=CGRectMake((buttonWH+magin)*3, (buttonWH+magin)*3, buttonWH, buttonWH);
    
    self.button8=[self buttonWithTitle:@"8" tag:8];
    self.button8.frame=CGRectMake((buttonWH+magin)*2, (buttonWH+magin)*3, buttonWH, buttonWH);
    
    self.button9=[self buttonWithTitle:@"9" tag:8];
    self.button9.frame=CGRectMake((buttonWH+magin)*1, (buttonWH+magin)*3, buttonWH, buttonWH);
    
    self.button10=[self buttonWithTitle:@"10" tag:8];
    self.button10.frame=CGRectMake(0, (buttonWH+magin)*3, buttonWH, buttonWH);
    
    self.button11=[self buttonWithTitle:@"11" tag:8];
    self.button11.frame=CGRectMake(0, (buttonWH+magin)*2, buttonWH, buttonWH);
    
    self.button12=[self buttonWithTitle:@"12" tag:8];
    self.button12.frame=CGRectMake(0, (buttonWH+magin)*1, buttonWH, buttonWH);
    
    
    UIImageView *iconView=[[UIImageView alloc]init];
    iconView.image=[UIImage imageNamed:@"treasure_img_logo_normal"];
    iconView.frame=CGRectMake((buttonWH+magin)*1, (buttonWH+magin)*1, buttonWH*2+magin, buttonWH*2+magin);
    [self addSubview:iconView];
    self.iconView=iconView;
    

    
   
}


-(XLButtonImageView *)buttonWithTitle:(NSString *)title tag:(NSInteger)tag{
    
    XLButtonImageView *button=[[XLButtonImageView alloc]init];
    button.tag=tag;
    button.titleLabel.text=title;
    button.lineView.hidden=YES;
    //    [button setTitle:title forState:(UIControlStateNormal)];
    // //   button.backgroundColor=[UIColor orangeColor];
    //    [button setBackgroundImage:[UIImage imageNamed:@"tankuang_xiaobox"] forState:(UIControlStateNormal)];
    //    [button addTarget:self action:@selector(btnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    [self addSubview:button];
    [self.buttonArray addObject:button];
    return button;
    
    
}

#pragma mark----------------赋值

-(int)getRandomNumber:(int)from to:(int)to
{
    return (int)(from + (arc4random() % (to - from + 1)));
}


//测试抽奖次数的
-(void)setTestArray:(NSMutableArray *)testArray{
    _testArray=testArray;
    
    [self.mutArray removeAllObjects];
    [self.mutArray addObjectsFromArray:testArray];
    //    NSLog(@"转的下标：%ld",self.countNumber);
    NSString *count=self.mutArray[self.countNumber];
    
    
    //    _stopCount = 0;
    _currentTime =0;
    
    self.moveTime=0.05;
    self.time = 0.05;
    
    
    self.stopCount=[count intValue];
    //  NSLog(@"第一个值:%@",count);
    
    self.stopTime = 11+12*1 + self.stopCount;
    //    NSLog(@"%d",self.stopTime);
    [self.startBtn setEnabled:NO];
    self.startTimer = [NSTimer scheduledTimerWithTimeInterval:self.time target:self selector:@selector(start:) userInfo:nil repeats:YES];
}

-(void)again{
    
   
//    NSArray *test=[NSArray arrayWithObjects:@"2",@"5",@"10", nil];
    NSString *count=self.mutArray[self.countNumber];
    
    NSString  *count2=self.mutArray[self.countNumber-1];
    _currentTime =[count2 intValue];
 //   NSLog(@"中奖数字：%@-------%ld",count,self.countNumber);
//    _stopCount = 0;
//    _currentTime =_stopTime;
    
//    self.time = 0.1;
    self.time=self.moveTime;
    
    self.stopCount=[count intValue];
    self.stopTime = 11+12*1 + self.stopCount;
    [self.startBtn setEnabled:NO];
    self.startTimer = [NSTimer scheduledTimerWithTimeInterval:self.time target:self selector:@selector(start:) userInfo:nil repeats:YES];
    
}


- (void)start:(NSTimer *)timer {
    
    //代理
    if ([self.delegate respondsToSelector:@selector(luckViewStart)]) {
        [self.delegate luckViewStart];
    }
    
    if (self.temp ) {
        self.temp.lineView.hidden=YES;
    }
    
//    NSLog(@"中奖后的按钮：%d-------%d",self.currentTime,self.buttonArray.count);
    //中奖后的按钮
  
    XLButtonImageView *oldBtn = [self.buttonArray objectAtIndex:(self.currentTime % self.buttonArray.count)];
    oldBtn.lineView.hidden=NO;
    self.temp = oldBtn;
    
    
  
  
    // 停止循环
 // NSLog(@"开始：%d------%d",self.currentTime,self.stopTime);
    if (self.currentTime > self.stopTime) {
//        NSLog(@"结束是   试试  ：%d------%d",self.currentTime,self.stopTime);
        [timer invalidate];
        [self.startBtn setEnabled:YES];
        [self stopWithCount:self.currentTime%self.buttonArray.count];
        return;
    }
        self.currentTime++;
  
    
    // 一直循环
    if (self.currentTime > self.stopTime-6) {
        self.time += 0.05;
        [timer invalidate];
        self.startTimer = [NSTimer scheduledTimerWithTimeInterval:self.time target:self selector:@selector(start:) userInfo:nil repeats:YES];
    }
    
    
  
}

- (void)stopWithCount:(NSInteger)count {
    
 //   NSLog(@"结束：%ld",count);
    
//     XLButtonImageView *oldBtn = [self.buttonArray objectAtIndex:self.currentTime % self.buttonArray.count];
//      oldBtn.lineView2.hidden=NO;
    
    if (count!=0) {   //转动下标非12
        
        //1.红色框显示
        XLButtonImageView *oldBtn = [self.buttonArray objectAtIndex:count-1];
        oldBtn.lineView2.hidden=NO;
        
        //2.黄色框隐藏
        XLButtonImageView *oldBtn2 = [self.buttonArray objectAtIndex:count];
        oldBtn2.lineView.hidden=YES;
        
    }else{    //转动下标是12
     //   NSLog(@"count为0时");
    //1.红色框显示
        XLButtonImageView *oldBtn = [self.buttonArray objectAtIndex:11];
        oldBtn.lineView2.hidden=NO;
        
         //2.黄色框隐藏
        XLButtonImageView *oldBtn2 = [self.buttonArray objectAtIndex:0];
        oldBtn2.lineView.hidden=YES;
    }
   

   
    
    
 //   NSLog(@"结束了%ld-------%ld",self.countNumber,self.mutArray.count);
    if (self.countNumber<self.mutArray.count-1) {
        dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0/*延迟执行时间*/ * NSEC_PER_SEC));
//        NSLog(@"次数不够，再转一次");
        self.countNumber++;
        dispatch_after(delayTime, dispatch_get_main_queue(), ^{
            [self again];
        });
     
        
    }else{
        [NSThread sleepForTimeInterval:1];

//        NSLog(@"真正结束了");
        self.countNumber=0;
        if ([self.delegate respondsToSelector:@selector(luckViewStop)]) {
            [self.delegate luckViewStop];
        }
        
      //  [self.mutArray removeAllObjects];
        
        //1.将中奖后的框隐藏掉
        for (XLButtonImageView *buttonView in self.buttonArray) {
            buttonView.lineView2.hidden=YES;
            buttonView.lineView.hidden=YES;
        }
    }
    
    
    
}




//3.设置frame
-(void)layoutSubviews{
    [super layoutSubviews];
    
    
}


@end
