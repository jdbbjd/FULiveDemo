//
//  AppDelegate.m
//  FUAPIDemo
//
//  Created by 刘洋 on 2017/1/9.
//  Copyright © 2017年 刘洋. All rights reserved.
//

#import "AppDelegate.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import "FURenderer.h"
#import "FUManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [FUManager shareManager];
    [self renderToImage];
    
    float expression[46];
    if (fuGetFaceInfo(0, "expression", expression, 46) == 0)
    {
        memset(expression, 0, sizeof(float)*46);
    }
    
    for (int i = 0; i<23; i++) {
        printf("expression %02d: %f         expression %02d: %f\n",2*i,expression[2*i],2*i+1,expression[2*i+1]);
    }
    
    printf("\n\n\n");
    
    [SVProgressHUD setMinimumDismissTimeInterval:1.5];
    return NO;
}

- (void)renderToImage
{
    UIImage *image = [UIImage imageNamed:@"timg.jpg"];
    
    CFDataRef dataFromImageDataProvider = CGDataProviderCopyData(CGImageGetDataProvider(image.CGImage));
    GLubyte *imageData = (GLubyte *)CFDataGetBytePtr(dataFromImageDataProvider);
    CGSize size = image.size;
    
    for (int i = 0; i<15; i++) {
        [FURenderer trackFace:FU_FORMAT_BGRA_BUFFER inputData:imageData width:size.width height:size.height];
    }
    
    
    CGDataProviderRef dataProvider = CGDataProviderCreateWithCFData(dataFromImageDataProvider);
    CGColorSpaceRef colorSpaceRef    = CGColorSpaceCreateDeviceRGB();
    
    CGImageRef cgImage = CGImageCreate(image.size.width, image.size.width, 8, 32, image.size.width * 4, colorSpaceRef, kCGBitmapByteOrderDefault | kCGImageAlphaLast, dataProvider, NULL, true, kCGRenderingIntentDefault);
    
    image = [UIImage imageWithCGImage:cgImage];
    
    CGImageRelease(cgImage);
    CGColorSpaceRelease(colorSpaceRef);
    CFRelease(dataProvider);
    CFRelease(dataFromImageDataProvider);
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
