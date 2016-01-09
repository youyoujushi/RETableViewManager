//
//  REBoolTextItem.h
//  YiCeTong
//
//  Created by youyoujushi on 15/9/29.
//  Copyright (c) 2015年 cellcom. All rights reserved.
//
/************cell含有一个UISwitch和UILabel*************/
#import "REBoolItem.h"

@interface REBoolTextItem : REBoolItem

@property (copy,nonatomic)  NSString *valueText;//当前cell显示的文本
@property (copy,nonatomic)  NSString *onText;//"开"状态下的文本
@property (copy,nonatomic)  NSString *offText;//“关”状态下的文本

/**
 *  设定cell不同状态显示的文本
 *
 *  @param onText “开”状态下的文本
 *  @param offText “关”状态下的文本
 */
- (void) setOnText:(NSString*)onText offText:(NSString*)offText;

@end
