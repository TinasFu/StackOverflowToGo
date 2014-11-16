//
//  WebViewController.h
//  StackOverflowToGo
//
//  Created by Shiquan Fu on 11/11/14.
//  Copyright (c) 2014 Tina Fu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "NetworkController.h"
#import "AppDelegate.h"

@interface WebViewController : UIViewController <WKNavigationDelegate>

@property WKWebView *webView;
@property (strong, nonatomic) NetworkController *networkController;

@end
