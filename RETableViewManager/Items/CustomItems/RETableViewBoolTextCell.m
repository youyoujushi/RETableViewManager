//
//  RETableViewBoolTextCell.m
//  YiCeTong
//
//  Created by youyoujushi on 15/9/29.
//  Copyright (c) 2015年 cellcom. All rights reserved.
//

#import "RETableViewBoolTextCell.h"
@interface RETableViewBoolTextCell()

@property (nonatomic,strong) UILabel *valueLabel;


@end

@implementation RETableViewBoolTextCell


- (void)cellDidLoad{
    [super cellDidLoad];
    
    NSInteger margin = self.tableViewManager.style.contentViewMargin*2;
    NSInteger cellWidth     = [UIScreen mainScreen].bounds.size.width - margin;
    CGFloat  switchWidth   = self.switchView.frame.size.width;
    CGRect rect = CGRectMake(cellWidth-switchWidth-120, 0, 100, self.tableViewManager.style.cellHeight);
    
    self.valueLabel   = [[UILabel alloc]initWithFrame:rect];
    self.valueLabel.textAlignment    =   NSTextAlignmentRight;
    self.valueLabel.backgroundColor  =   [UIColor clearColor];
    self.valueLabel.textColor        =   [UIColor blackColor];
    
    [self.contentView addSubview:self.valueLabel];
    
    [self.switchView addTarget:self action:@selector(switchValueDidChange:) forControlEvents:UIControlEventValueChanged];
}


- (void)cellWillAppear{
    [super cellWillAppear];

    self.valueLabel.text = self.item.value ? self.item.onText : self.item.offText;
    if(self.item.enabled){
        self.valueLabel.textColor    = self.item.titleTextColor ? self.item.titleTextColor : [UIColor blackColor];
    }else
        self.valueLabel.textColor    = [UIColor lightGrayColor];
    
    if(self.item.enabled){
        self.textLabel.textColor    = self.item.titleTextColor ? self.item.titleTextColor : [UIColor blackColor];
        self.valueLabel.textColor     = self.item.detailTextColor ? self.item.detailTextColor : [UIColor blackColor];
    }else{
        self.textLabel.textColor    = self.item.titleDisableTextColor ? self.item.titleDisableTextColor : [UIColor lightGrayColor];
        self.valueLabel.textColor     = self.item.detailDisableTextColor ? self.item.detailDisableTextColor : [UIColor blackColor];
    }
}


- (void)switchValueDidChange:(UISwitch *)switchView
{
    self.item.value = switchView.isOn;
    self.valueLabel.text = self.item.value ? self.item.onText : self.item.offText;
    if (self.item.switchValueChangeHandler)
        self.item.switchValueChangeHandler(self.item);
}


/*- (void)setEnabled:(BOOL)enabled {
    _enabled = enabled;
    
    self.userInteractionEnabled = _enabled;
    
    self.textLabel.enabled = _enabled;
    self.textField.enabled = _enabled;
    
    //change the text color when enable or disable the cell
    if(_enabled){
        if(_item.titleTextColor)
            self.textLabel.textColor        = _item.titleTextColor;
        if(_item.detailTextColor)
            self.textField.textColor        = _item.detailTextColor;
    }else{
        if(!_item.titleTextColor)
            _item.titleTextColor    = self.textLabel.textColor;
        if(!_item.detailTextColor)
            _item.detailTextColor   = self.textField.textColor;
        self.textLabel.textColor    = [UIColor lightGrayColor];
        self.textField.textColor    = [UIColor lightGrayColor];
    }
    
}

/*- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([object isKindOfClass:[REBoolTextItem class]] && [keyPath isEqualToString:@"enabled"]) {
        BOOL newValue = [[change objectForKey: NSKeyValueChangeNewKey] boolValue];
        
        self.enabled = newValue;
    }
}*/

@end
