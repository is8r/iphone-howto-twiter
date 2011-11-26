//
//  AppDelegate.h
//  untitled
//

#import <UIKit/UIKit.h>

//twitter
#import "SA_OAuthTwitterEngine.h"
#import "SA_OAuthTwitterController.h"
#define kOAuthConsumerKey                   @"xxxxx"                        //REPLACE ME
#define kOAuthConsumerSecret                @"xxxxx"                        //REPLACE ME

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
    
    //twitter
    SA_OAuthTwitterEngine *twitterEngine;
    NSNumber *twitterState;//0,1,2 でログイン状態をメモログイン前、ログイン後、つぶやき終了
}

@property (nonatomic, retain) UIWindow *window;

//twitter
-(NSNumber *) twit:(NSString*)s;

@end
