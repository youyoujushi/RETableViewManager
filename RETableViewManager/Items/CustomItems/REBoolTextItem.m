//
//  REBoolTextItem.m
//  YiCeTong
//
//  Created by youyoujushi on 15/9/29.
//  Copyright (c) 2015年 cellcom. All rights reserved.
//

#import "REBoolTextItem.h"

@implementation REBoolTextItem

- (void) setOnText:(NSString*)onText offText:(NSString*)offText{
    _onText     = onText;
    _offText    = offText;
}

- (NSString*)valueText{

    return self.value ? _onText : _offText;
}

- (NSString*)onText{
    if(_onText.length == 0)
        return @"是";
    else
        return _onText;
}

- (NSString*)offText{
    if(_onText.length == 0)
        return @"否";
    else
        return _offText;
}

@end
