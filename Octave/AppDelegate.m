//
//  AppDelegate.m
//  Octave
//
//  Created by Sujeet Sinha on 13/12/15.
//  Copyright (c) 2015 Sujeet Sinha. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize hud = _hud;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark Progress hud methods
#pragma mark -

- (void)showHUDWithTitle:(NSString *)title withSubTitle:(NSString *)subTitle {
	_hud = [[MBProgressHUD alloc]initWithWindow:self.window];
	[self.window addSubview:_hud];
	_hud.labelText = title;
	_hud.detailsLabelText = subTitle;
	[_hud show:YES];
}

- (void)showHUD {
	[self showHUDWithTitle:nil withSubTitle:nil];
}

- (void)killHUD {
	if(_hud) {
		[_hud hide:YES];
		[_hud removeFromSuperview];
		_hud = nil;
	}
}


@end
