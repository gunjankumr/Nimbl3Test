//
//  AppDelegate.h
//  Octave
//
//  Created by Sujeet Sinha on 13/12/15.
//  Copyright (c) 2015 Sujeet Sinha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) MBProgressHUD *hud;

- (void)showHUDWithTitle:(NSString *)title withSubTitle:(NSString *)subTitle;
- (void)showHUD;
- (void)killHUD;


@end

