
//
//  YHConfig.h
//  youhe
//
//  Created by LY on 2018/1/29.
//  Copyright © 2018年 youhe. All rights reserved.
//

#ifndef YHConfig_h
#define YHConfig_h

#define UmengAppkey @"5b726a0ca40fa3060600008c"

//尺寸320 414 375
#define ScreenWidth kScreenWidth

// 判断是否是iPhone X X和XS 一样
#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhoneXR ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhoneXMAS ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)



#define iPhoneOVERALL (iPhoneX||iPhoneXR||iPhoneXMAS ? YES : NO)

// 状态栏高度
#define StatusBarH (iPhoneOVERALL ? 44.f : 20.f)
// 顶部Iphone高度
#define TopBarH (iPhoneOVERALL ? 24.f : 0.f)
// 顶部Iphone高度
#define LTopBarH (iPhoneOVERALL ? 14.f : 0.f)
// 导航栏高度MAS
#define NavBarH (iPhoneOVERALL ? 88.f : 64.f)
// tabBar高度
#define TabbarH (iPhoneOVERALL ? (49.f+34.f) : 49.f)
// CLY高度衰减
#define CLYTabbarH (iPhoneOVERALL ? (12.f) : 0.f)
// home indicator
#define HomeIndicatorH (iPhoneOVERALL ? 34.f : 0.f)


#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

#define IS_PAD (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)



//图片前缀


//颜色宏定义
#define BASECOLOR [Tool hexStringToColor:@"0xe96d68"]
#define YHRED [Tool hexStringToColor:@"0xff0000"]

//字体宏定义
#define FONT(a)      [UIFont systemFontOfSize:a]
#define FONTBOLD(a)  [UIFont boldSystemFontOfSize:a]

#define FONT12 [UIFont systemFontOfSize:12]
#define FONTBOLD12 [UIFont boldSystemFontOfSize:12]

#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"[文件名：%s]\n [函数名：%s] \n [行号： %d] \n" fmt), __FILE__, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#define DLogRect(rect)  DLog(@"%s x=%f, y=%f, w=%f, h=%f", #rect, rect.origin.x, rect.origin.y,rect.size.width, rect.size.height)
#define DLogPoint(pt) DLog(@"%s x=%f, y=%f", #pt, pt.x, pt.y)
#define DLogSize(size) DLog(@"%s w=%f, h=%f", #size, size.width, size.height)
#define ALog(fmt, ...)  { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%s\n [Line %d] ", __PRETTY_FUNCTION__, __LINE__] message:[NSString stringWithFormat:fmt, ##__VA_ARGS__]  delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil]; [alert show]; }
#else
#define DLog(...)
#define DLogRect(rect)
#define DLogPoint(pt)
#define DLogSize(size)
#define ALog(...)
#endif
//Other
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#define SafeStringYH(string)  (string? string:@"")

#define isLogin [YHAppSetting sharedInstance].userModel.token.length

#endif /* YHConfig_h */
