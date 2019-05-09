//
//  XLButtonImageView.m
//  九宫格抽奖
//
//  Created by liuxiangliang on 2018/9/14.
//  Copyright © 2018年 iOS . All rights reserved.
//

#import "XLButtonImageView.h"
@interface XLButtonImageView()





@end
@implementation XLButtonImageView

//1.初始化方法
-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self setupView];
    }
    return self;
}

//2.添加子控件
-(void)setupView{
    
    UIImageView *lineView=[[UIImageView alloc]init];
    lineView.image=[UIImage imageNamed:@"img_turn_selected"];
    [self addSubview:lineView];
    self.lineView=lineView;
    
    UIImageView *lineView2=[[UIImageView alloc]init];
    lineView2.image=[UIImage imageNamed:@"img_prize_selected"];
    lineView2.hidden=YES;
    [self addSubview:lineView2];
    self.lineView2=lineView2;
    
    
    UIImageView *iconView=[[UIImageView alloc]init];
    iconView.image=[UIImage imageNamed:@"tankuang_xiaobox"];
    [self addSubview:iconView];
    self.iconView=iconView;
    
   
    UILabel *titleLabel=[[UILabel alloc]init];
    titleLabel.textColor=[UIColor whiteColor];
    titleLabel.textAlignment=NSTextAlignmentCenter;
    titleLabel.font=[UIFont systemFontOfSize:30];
    [self addSubview:titleLabel];
    self.titleLabel=titleLabel;
    
}

//3.设置frame
-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat margin=7;
    
      self.lineView.frame=CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    
    self.lineView2.frame=CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    
    self.iconView.frame=CGRectMake(margin, margin, self.bounds.size.width-margin*2, self.bounds.size.height-margin*2);
    
    self.titleLabel.frame=CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.width);
  
    
}


@end
