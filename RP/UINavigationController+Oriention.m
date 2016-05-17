//
//  UINavigationController+Oriention.m
//  RP
//
//  Created by zhangguang on 16/5/17.
//  Copyright © 2016年 birneysky. All rights reserved.
//

#import "UINavigationController+Oriention.h"

@implementation UINavigationController (Oriention)


- (BOOL)shouldAutorotate
{
    if ([self.topViewController respondsToSelector:@selector(shouldAutorotate)]) {
        return [self.topViewController shouldAutorotate];
    }
    
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    if ([self.topViewController respondsToSelector:@selector(supportedInterfaceOrientations)]) {
        return [self.topViewController supportedInterfaceOrientations];
    }
    return UIInterfaceOrientationMaskAll;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    if ([self.topViewController respondsToSelector:@selector(preferredInterfaceOrientationForPresentation)]) {
        return [self.topViewController preferredInterfaceOrientationForPresentation];
    }
    
    return UIInterfaceOrientationPortrait;
}

@end
