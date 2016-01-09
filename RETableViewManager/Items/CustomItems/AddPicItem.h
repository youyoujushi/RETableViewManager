//
//  AddPicItem.h
//  YiCeTong
//
//  Created by youyoujushi on 15/9/28.
//  Copyright (c) 2015年 cellcom. All rights reserved.
//

#import "RETableViewItem.h"

@interface AddPicItem : RETableViewItem

@property (strong,nonatomic,readwrite) NSMutableArray *imageUrlArray;//url地址
@property (strong,nonatomic,readwrite) NSMutableArray *imageViewArray;//cell中图片数组，元素为YYJSUploadImageView
@property (assign,nonatomic,readwrite) NSInteger maxImageNum;
@property (assign,nonatomic,getter=isEditing) BOOL      editing;//是否正在编辑


/**
 *  返回没有url地址的imageView数量
 *
 *  @return 返回没有url地址的imageView数量
 */
- (NSInteger)countOfNoUrl;

@end
