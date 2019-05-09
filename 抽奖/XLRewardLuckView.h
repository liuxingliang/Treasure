//
//  XlRewardLuckView.h
//  SwapCenter
//
//  Created by liuxiangliang on 2018/9/13.
//  Copyright © 2018年 zhiyiLiu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XLRewardLuckView;
@protocol XlRewardLuckViewDelegate<NSObject>

-(void)luckViewStart;
-(void)luckViewStop;


@end

@interface XLRewardLuckView : UIView
/**
 *   1.
 **/
@property (nonatomic,assign)NSInteger winTag;

/**
 *   1.抽奖的结果
 **/
@property (nonatomic,strong)NSArray *prizeArray;

/**
 *   1.
 **/
@property (nonatomic,strong)id<XlRewardLuckViewDelegate>delegate;

/**
 *   1.奖品数组
 **/
@property (nonatomic,strong)NSArray *treasureArray;

/**
 *   1.
 **/
@property (nonatomic,strong)NSMutableArray *testArray;

/**
 *   1.中奖人数数组
 **/
@property (nonatomic,strong)NSArray *numberArray;


@end
