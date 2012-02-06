//
//  TorchLED4AppDelegate.h
//  TorchLED4
//
//  Created by Jesus Guerra Rosas on 6/20/11.
//  Copyright 2011 Nearsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TorchLED4ViewController;

@interface TorchLED4AppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet TorchLED4ViewController *viewController;

@end
