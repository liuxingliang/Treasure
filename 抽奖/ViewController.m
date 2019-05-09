//
//  ViewController.m
//  抽奖
//
//  Created by liu on 2019/5/8.
//  Copyright © 2019 iOS . All rights reserved.
//

#import "ViewController.h"
#import "XLRewardLuckView.h"



@interface ViewController ()<XlRewardLuckViewDelegate>
/**
 *   1.
 **/
@property (nonatomic,strong)XLRewardLuckView *luckView;
/**
 *   1.
 **/
@property (nonatomic,assign)NSInteger currentTag;
/**
 *   1.显示中奖结果
 **/
@property (nonatomic,strong)UILabel *resultLabel;
/**
 *   1.
 **/
@property (nonatomic,strong)UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.currentTag=1;
    
    //1.顶部导航
    NSArray *array=[NSArray arrayWithObjects:@"一次",@"五次", nil];
    UISegmentedControl *segment=[[UISegmentedControl alloc]initWithItems:array];
    segment.frame=CGRectMake(0, 0, 150, 30);
    segment.selectedSegmentIndex=0;
    segment.tintColor=[UIColor orangeColor];
    [segment addTarget:self action:@selector(clickPageControl:) forControlEvents:(UIControlEventValueChanged)];
    //    [self.navigationItem.titleView addSubview:segment];
    self.navigationItem.titleView=segment;
    
    
    XLRewardLuckView *luckView=[[XLRewardLuckView alloc]init];
    luckView.backgroundColor=RGBColor(230, 61, 56);
    luckView.frame=CGRectMake(0, 120, ScreeWidth-0, ScreeWidth-30);
    luckView.delegate=self;
    [self.view addSubview:luckView];
    self.luckView=luckView;
    
    //抽奖结果显示
    UILabel *resultLabel=[[UILabel alloc]init];
    resultLabel.text=@"中奖结果：";
    resultLabel.frame=CGRectMake(100, ScreeWidth-30+120+20, 200, 30);
    [self.view addSubview:resultLabel];
    self.resultLabel=resultLabel;
    
    UIButton *button=[[UIButton alloc]init];
    button.backgroundColor=[UIColor orangeColor];
    button.frame=CGRectMake(100, ScreeWidth-30+120+100, 120, 40);
    [button setTitle:@"抽奖" forState:(UIControlStateNormal)];
    button.layer.cornerRadius=20;
    button.clipsToBounds=YES;
    [button addTarget:self action:@selector(clickButton) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button];
    self.button=button;

 
    
}

//选择转动一次还是5次，这个可以自己控制数量吧
-(void)clickPageControl:(UISegmentedControl *)sender{
    
   
    if (sender.selectedSegmentIndex==0) {
         self.currentTag=1;
    }else{
         self.currentTag=5;
    }
  
}

//点击抽奖转盘
-(void)clickButton{
    
    //0.为防止抽奖中再次点击，先取消点击状态，转动结束后再开启
    self.button.userInteractionEnabled=NO;
    self.button.alpha=0.5;
    
    //1.先获取随机结果，再传值进行转动
    NSMutableArray *mutArray=[NSMutableArray array];
    for ( int i=0; i<self.currentTag; i++) {
        int x =[self getRandomNumber:1 to:11];
        NSString *string=[NSString stringWithFormat:@"%d",x];
        [mutArray addObject:string];
    }
    NSString *result = [mutArray componentsJoinedByString:@","];
    self.resultLabel.text=[NSString stringWithFormat:@"中奖结果：%@",result];
    
    //2.赋值给转盘进行转动
    self.luckView.testArray=mutArray;
    
    
}

#pragma mark----------转盘代理
//1.开始了
-(void)luckViewStart{
    //  NSLog(@"开始了，按钮不能点击");
    
    
}
//2.结束了
-(void)luckViewStop{
    
    self.button.userInteractionEnabled=YES;
    self.button.alpha=1;
    // NSLog(@"结束了，按钮可以");
//    self.buttonView.startBtn.userInteractionEnabled=YES;
//    self.buttonView.startBtn.alpha=1;
//    //      self.buttonView.startBtn.backgroundColor=[UIColor clearColor];
//
//    //中奖弹出图
//    [XLRewardWinningPopView showRewardWinningPopViewWithBlock:^{
//
//    } resultArray:self.prizeArray];
//
//    //将奖品数组清空
//    [self.prizeArray removeAllObjects];
    
}

#pragma mark----------获取随机数
-(int)getRandomNumber:(int)from to:(int)to
{
    return (int)(from + (arc4random() % (to - from + 1)));
}


@end
