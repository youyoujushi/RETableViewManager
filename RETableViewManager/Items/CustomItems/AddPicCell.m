//
//  AddPicCell.m
//  YiCeTong
//
//  Created by youyoujushi on 15/9/28.
//  Copyright (c) 2015年 cellcom. All rights reserved.
//

#import "AddPicCell.h"
#import "HTHShowPicVC.h"
#import "DXAlertView.h"

#define imgWidth    90
#define imgSpace    15
@interface AddPicCell()

@property (nonatomic,strong) HTHShowPicVC       *showPicVC;
@property (nonatomic,strong) YYSelectPicture    *selPic;
@property (nonatomic,strong) UIScrollView       *scrollView;
@property (nonatomic,assign) CGFloat            nextImgViewX;//下一个imgview的x坐标


@end

@implementation AddPicCell

//@dynamic item;
@synthesize item = _item;

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager{
    return 90;
}

- (void)cellDidLoad{
    [super cellDidLoad];

}

- (void)cellWillAppear{
    [super cellWillAppear];
    for(UIView *view in self.contentView.subviews){
        [view removeFromSuperview];
        
    }
    

    
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(15, 0, SCREEN_WIDTH-30, imgWidth)];
    [self.contentView addSubview:_scrollView];
    
    //NSArray *urlArray = self.item.imageUrlArray;
    NSInteger x = 0;
    NSInteger y = 5;
    NSInteger width = imgWidth;
    NSInteger height = width-10;
    
    for(NSInteger i=0;i<self.item.imageViewArray.count;i++){

        YYJSUploadImageView *imgView = self.item.imageViewArray[i];
        imgView.frame = CGRectMake(x, y, width, height);
        imgView.tag     =   100+i;
        [imgView setSelectImageBlock:^(YYJSUploadImageView *uploadImageView) {
           uploadImageView.imgUrl   =   nil;
        }];
        
        for(UIGestureRecognizer *gesture in imgView.gestureRecognizers){
            [imgView removeGestureRecognizer:gesture];
        }
        //添加手势
        if(self.item.isEditing){
            UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressDelete:)];
            [imgView addGestureRecognizer:longPress];
            [imgView setTapSelectPicOn:YES];
        }else{
            [self    addTapPicToShowGesture];
            [imgView setTapSelectPicOn:NO];
        }
        
        [_scrollView    addSubview:imgView];
        
        x += width + imgSpace;
        _nextImgViewX   =   x;
        [_scrollView setContentSize:CGSizeMake(x, 0)];
    }
    
    if(self.item.imageViewArray.count < self.item.maxImageNum && self.item.isEditing){
        //增加图片的按钮
        UIButton *addPicBtn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, width, height)];
        [addPicBtn setBackgroundImage:[UIImage imageNamed:@"yct_jsb_add_pic_press"] forState:UIControlStateNormal];
        [addPicBtn addTarget:self action:@selector(addPicBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        addPicBtn.layer.cornerRadius    =   5;
        addPicBtn.clipsToBounds         =   YES;
        [_scrollView addSubview:addPicBtn];
        
        x   +=  width + imgSpace;
        [_scrollView setContentSize:CGSizeMake(x, 0)];
        _nextImgViewX   =   x;
    }
}

//添加点击图片浏览的手势
- (void)addTapPicToShowGesture{

    for(YYJSUploadImageView *imgView in self.item.imageViewArray){
        UITapGestureRecognizer *tap     = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapShowPic:)];
        [imgView addGestureRecognizer:tap];
        imgView.userInteractionEnabled  =   YES;
    }
    
}

//点击图片
- (void)tapShowPic:(UIGestureRecognizer*)gesture{
    NSInteger index = gesture.view.tag-100;
    /*NSMutableArray *urlArray = [[NSMutableArray alloc]init];
    for(NSString *str in self.item.imageUrlArray){
        [urlArray addObject:[NSURL URLWithString:str]];
    }*/
    self.showPicVC = [[HTHShowPicVC alloc]initWithSourceData:self.item.imageUrlArray withIndex:index];
    [_showPicVC show];
}

//长按图片
- (void)longPressDelete:(UILongPressGestureRecognizer*)gesture{
    
    static BOOL alertShowing = NO;
    if(alertShowing)
        return;
    
    alertShowing = YES;
    DXAlertView *alert = [[DXAlertView alloc]initWithTitle:@"提示" contentText:@"确定要删除图片吗？" leftButtonTitle:@"确定" rightButtonTitle:@"取消"];
    [alert show];
    
    alert.rightBlock   = ^(){ alertShowing = NO;};
    alert.dismissBlock = ^(){ alertShowing = NO;};
    alert.leftBlock = ^(){
        YYJSUploadImageView *imgView = (YYJSUploadImageView*)gesture.view;
        [self.item.imageViewArray removeObject:imgView];
        [self.tableViewManager.tableView reloadData];
    };
    
}

//点击添加图片按钮
- (void)addPicBtnClicked:(UIButton*)btn{
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    _selPic = [[YYSelectPicture alloc]init];
    [_selPic popUpTheOptionBox:vc block_selectedPic:^(UIImage *image) {

        YYJSUploadImageView *imgView = [[YYJSUploadImageView alloc]initWithFrame:btn.frame];
        imgView.image   =   image;
        imgView.tag     =   100+self.item.imageViewArray.count;
        [imgView setSelectImageBlock:^(YYJSUploadImageView *uploadImageView) {
            uploadImageView.imgUrl   =   nil;
        }];
        
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressDelete:)];
        [imgView addGestureRecognizer:longPress];

        [_scrollView    addSubview:imgView];
        [self.item.imageViewArray  addObject:imgView];
        
        if(self.item.imageViewArray.count < self.item.maxImageNum){
            CGRect rect     = btn.frame;
            rect.origin.x   = _nextImgViewX;
            btn.frame       = rect;
            _nextImgViewX += imgWidth +  imgSpace;
            [_scrollView setContentSize:CGSizeMake(_nextImgViewX, 0)];
        }else
            btn.hidden = YES;
    }];
}

@end
