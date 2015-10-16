//
//  MultilineTextCell.h
//  RETableViewManagerExample
//
//  Created by Roman Efimov on 9/11/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//


@interface MultilineTextCell : RETableViewCell

@property (strong, readwrite, nonatomic) RETableViewItem *item;
@property (strong, readonly, nonatomic) UILabel *multilineLabel;

@end
