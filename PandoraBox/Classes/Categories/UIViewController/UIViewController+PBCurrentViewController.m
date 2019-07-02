//
//  UIViewController+PBCurrentViewController.m
//  PandoraBox
//
//  Created by 张鹏 on 2019/7/3.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import "UIViewController+PBCurrentViewController.h"

@implementation UIViewController (PBCurrentViewController)

+ (UIViewController *)pb_currentViewController {
    UIViewController* viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    return [UIViewController pb_findBestViewController:viewController];
}

+ (UIViewController*)pb_findBestViewController:(UIViewController*)vc {
    if (vc.presentedViewController) {
        return [UIViewController pb_findBestViewController:vc.presentedViewController];
    } else if ([vc isKindOfClass:[UISplitViewController class]]) {
        UISplitViewController* svc = (UISplitViewController*)vc;
        if (svc.viewControllers.count > 0) {
            return [UIViewController pb_findBestViewController:svc.viewControllers.lastObject];
        } else {
            return vc;
        }
    } else if ([vc isKindOfClass:[UINavigationController class]]) {
        UINavigationController* nvc = (UINavigationController*)vc;
        if (nvc.viewControllers.count > 0) {
            return [UIViewController pb_findBestViewController:nvc.topViewController];
        } else {
            return vc;
        }
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        UITabBarController* tvc = (UITabBarController*)vc;
        if (tvc.viewControllers.count > 0) {
            return [UIViewController pb_findBestViewController:tvc.selectedViewController];
        } else {
            return vc;
        }
    } else {
        return vc;
    }
}

@end
