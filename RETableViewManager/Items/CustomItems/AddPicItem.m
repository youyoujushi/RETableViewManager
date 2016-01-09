//
//  AddPicItem.m
//  YiCeTong
//
//  Created by youyoujushi on 15/9/28.
//  Copyright (c) 2015年 cellcom. All rights reserved.
//

#import "AddPicItem.h"

@implementation AddPicItem

- (instancetype)init{
    self = [super init];
    _imageUrlArray      =   [[NSMutableArray alloc]init];
    _imageViewArray     =   [[NSMutableArray alloc]init];
    _maxImageNum        =   4;
    return self;
}

- (NSInteger)countOfNoUrl{
    
    NSInteger count = 0;
    
    for(YYJSUploadImageView *imgView in _imageViewArray){
        if(imgView.imgUrl.length == 0)
            count++;
    }
    
    return count;
}

- (NSMutableArray*)imageUrlArray{
    
    [_imageUrlArray removeAllObjects];
    
    for(YYJSUploadImageView *imgView in _imageViewArray){
        NSString *url = imgView.imgUrl;
        url = url.length > 0 ? url : @"";
        [_imageUrlArray addObject:url];
    }
    
    return _imageUrlArray;
}

@end
