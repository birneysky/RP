//
//  UINavigationController+Oriention.h
//  RP
//
//  Created by zhangguang on 16/5/17.
//  Copyright © 2016年 birneysky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (Oriention)

- (BOOL)shouldAutorotate;

- (UIInterfaceOrientationMask)supportedInterfaceOrientations;

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation;

@end
