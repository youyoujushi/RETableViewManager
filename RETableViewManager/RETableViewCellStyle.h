//
// RETableViewCellStyle.h
// RETableViewManager
//
// Copyright (c) 2013 Roman Efimov (https://github.com/romaonthego)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

#import <Foundation/Foundation.h>
#import "RETableViewCell.h"

enum EN_SPACE_TITLE_DETAIL{
     SPACE_TITLE_DETAIL_NEARBY = -1, //the space is default 10 pixels
     SPACE_TITLE_DETAIL_ALIGN = -2   //the space is align in the section
};

@interface RETableViewCellStyle : NSObject <NSCopying>

@property (assign, readwrite, nonatomic) CGFloat cellHeight;
@property (assign, readwrite, nonatomic) UITableViewCellSelectionStyle defaultCellSelectionStyle;
@property (assign, readwrite, nonatomic) CGFloat backgroundImageMargin;
@property (assign, readwrite, nonatomic) CGFloat contentViewMargin;
@property (strong, readwrite, nonatomic) NSMutableDictionary *backgroundImages;
@property (strong, readwrite, nonatomic) NSMutableDictionary *selectedBackgroundImages;

//add by youyoujushi 2015-10-01

/**
 *  the space between title and detail view,type of EN_SPACE_TITLE_DETAIL
 *  -1 or 0 : space between detail view and title is default 10
 *  -2 :space between detail view and title is the max space in the section
 *  >0 :space between detail view and title is the spaceTitleAndDetail value
 */
@property (assign, readwrite, nonatomic) NSInteger spaceTitleAndDetail;

//end add

- (BOOL)hasCustomBackgroundImage;
- (UIImage *)backgroundImageForCellType:(RETableViewCellType)cellType;
- (void)setBackgroundImage:(UIImage *)image forCellType:(RETableViewCellType)cellType;

- (BOOL)hasCustomSelectedBackgroundImage;
- (UIImage *)selectedBackgroundImageForCellType:(RETableViewCellType)cellType;
- (void)setSelectedBackgroundImage:(UIImage *)image forCellType:(RETableViewCellType)cellType;

@end
