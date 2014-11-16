//
//  WebViewController.m
//  StackOverflowToGo
//
//  Created by Shiquan Fu on 11/11/14.
//  Copyright (c) 2014 Tina Fu. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@property (strong, nonatomic) NSString *oAuthDomain;
@property (strong, nonatomic) NSString *clientID;
@property (strong, nonatomic) NSString *oAuthURL;
@end

@implementation WebViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.networkController = [(AppDelegate *)[[UIApplication sharedApplication] delegate] networkController];
    self.oAuthDomain = @"https://stackexchange.com/oauth/login_success";
    self.clientID = @"3839";
    self.oAuthURL = @"https://stackexchange.com/oauth/dialog";
    self.webView = [[WKWebView alloc] initWithFrame:self.view.frame];
    self.webView.navigationDelegate = self;
    NSURL *loginURL = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@?client_id=%@&redirect_uri=%@&scope=read_inbox", self.oAuthURL, self.clientID, self.oAuthDomain]];
    [self.webView loadRequest:[NSURLRequest requestWithURL:loginURL]];
    self.view = self.webView;

}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    
    NSURLRequest *request = navigationAction.request;
    NSURL *url = request.URL;
    NSLog(@"%@",url);
    
    if ([url.description containsString:@"access_token"]) {
        
        decisionHandler(WKNavigationActionPolicyAllow);
        NSArray *components = [[url description] componentsSeparatedByString:@"="];
        NSString *token = components[1];
        [[NSUserDefaults standardUserDefaults] setValue:token forKey:@"access_token"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
    } else {
        decisionHandler(WKNavigationActionPolicyAllow); // allow webview to show the page
    }
    
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
