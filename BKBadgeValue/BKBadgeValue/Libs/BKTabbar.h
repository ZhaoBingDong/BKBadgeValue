//
//  BKTabbar.h
//  BKTabbar
//
//  Created by dzb on 16/8/17.
//  Copyright © 2016年 大兵布莱恩特. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  自定义 tabBar 解决了 badgeValue 显示问题
 */
@interface BKTabbar : UITabBar

/**
 *  自定义 badgeValue 的背景色
 */
@property (nonatomic,strong,nullable) UIColor *badgeValueBackgroundColor;
/**
 *  自定义 badgeValue 的文字颜色
 */
@property (nonatomic,strong,nullable) UIColor *badgeValueTextColor;


@end
