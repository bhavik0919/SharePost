//
//  ViewController.m
//  SharePost
//
//  Created by Bhavik Panchal on 9/24/15.
//  Copyright © 2015 Bhavik Panchal. All rights reserved.
//

#import "ViewController.h"
#import <Social/Social.h>

//for the sharing conent in social site
//add  the serviece type for which site you have to share

SOCIAL_EXTERN NSString *const SLServiceTypeTwitter;
SOCIAL_EXTERN NSString *const SLServiceTypeFacebook;
SOCIAL_EXTERN NSString *const SLServiceTypeSinaWeibo;
SOCIAL_EXTERN NSString *const SLServiceTypeTencentWeibo;
SOCIAL_EXTERN NSString *const SLServiceTypeLinkedIn;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) viewDidAppear:(BOOL)animated{ [super viewDidAppear:animated];
  
    
    //if the service of twitter access than set initial text and add image of what ever u want to share with the twitter
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
    {
        SLComposeViewController *controller =
        [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        [controller setInitialText:@"MacBook Airs are amazingly thin!"];
        [controller addImage:[UIImage imageNamed:@"iron-man-3-18a"]];
        [controller addURL:[NSURL URLWithString:@"http://www.facebook.com/"]];
        
        controller.completionHandler = ^(SLComposeViewControllerResult result)
        {
            
            NSLog(@"Completed");
        };
        //present the view of the controller of the tweeter
        [self presentViewController:controller animated:YES completion:nil];
    }
    else
    {
        NSLog(@"The Facebook service is not available");
    } }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
