
//  BKTabbar.m
//  BKTabbar
//
//  Created by dzb on 16/8/17.
//  Copyright © 2016年 大兵布莱恩特. All rights reserved.
//

#import "BKTabbar.h"
#import "UITabBarItem+Extension.h"


@interface BKTabbar ()

@property (nonatomic,strong,nullable) NSMutableDictionary *badgeValuesDic;

@end

@implementation BKTabbar

- (NSMutableDictionary *)badgeValuesDic {
    if (!_badgeValuesDic) {
        _badgeValuesDic = [NSMutableDictionary dictionary];
    }
    return _badgeValuesDic;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    NSInteger indexTag        = 1000;
    NSMutableArray *tempArray = [NSMutableArray array];
    
    // 便利 tabbar 所有子视图 
    for (UIView *sub in self.subviews) {
        
        if ([sub isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            if ([tempArray containsObject:sub]) continue;
            [tempArray addObject:sub];
            
        }
    }
    // 临时数组保存四个按钮
    [tempArray sortUsingComparator:^NSComparisonResult(UIButton *btn1, UIButton *btn2) {
        
        NSNumber *number1 = [NSNumber numberWithFloat:btn1.frame.origin.x];
        NSNumber *number2 = [NSNumber numberWithFloat:btn2.frame.origin.x];
        
        return [number1 compare :number2];
        
    }];

   // 便利数组给 badgeValue 赋值
    for (UIButton *button in tempArray) {
    
        NSString *key       = [NSString stringWithFormat:@"%@",@(indexTag)];
        CGFloat buttonWidth = button.frame.size.width;
        UILabel *oldLabel   = [button viewWithTag:key.integerValue];

        // 先找重用 不存在就创建一个
        if (!oldLabel) {
            
            UILabel *label            = [[UILabel alloc] init];
            label.tag                 = indexTag;
            label.textColor           = self.badgeValueTextColor;
            label.textAlignment       = NSTextAlignmentCenter;
            label.font                = [UIFont systemFontOfSize:13.0f];
            label.backgroundColor     = self.badgeValueBackgroundColor;
            label.layer.masksToBounds = YES;
            [button addSubview:label];
            oldLabel                  = label;

        }

        oldLabel.hidden             = YES;
        UITabBarItem *currentItem   = self.badgeValuesDic[key];
        indexTag++;

        if (!currentItem) continue;
        if (currentItem.customBadgeValue == nil) continue;
        if ([currentItem.customBadgeValue isEqualToString:@"0"]) return;
        oldLabel.hidden             = NO;

        NSString *title             = currentItem.customBadgeValue;

        CGFloat itemWidth           = 0.0f;
        CGFloat cornerRadius        = 0.0f;
        NSInteger textLength        = title.length > 5 ? 5 : title.length;
        itemWidth                   = 18.0f + (textLength-1) *8.0f;
        cornerRadius                = 9.0f;

        oldLabel.frame              = CGRectMake(buttonWidth *0.58f, 2.0f, itemWidth, 18.0f);
        oldLabel.text               = title;
        oldLabel.layer.cornerRadius = cornerRadius;

    }
    
 
    
}

- (void)setItems:(NSArray<UITabBarItem *> *)items {
    
    [super setItems:items];
    
    NSInteger index       = 1000;

    for (UITabBarItem *item in self.items ) {

        item.index = index;

        [self.badgeValuesDic setValue:item forKey:[NSString stringWithFormat:@"%ld",(long)item.index]];
        
        index ++;
    }
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(badgeValueDidChange:) name:@"TabbarBadgeValueChange" object:nil];
        self.badgeValueBackgroundColor = [UIColor redColor];
        self.badgeValueTextColor       = [UIColor redColor];

    }
    return self;
}

#pragma mark - tabbar的 badgeValue 发生改变的通知

- (void)badgeValueDidChange:(NSNotification *)noti {
    
    UITabBarItem *item       = (UITabBarItem *)noti.object;

    if (!item || item.index == 0) return;

    NSString *key            = [NSString stringWithFormat:@"%ld",(long)item.index];

    self.badgeValuesDic[key] = item;

    [self setNeedsLayout];

}

@end
