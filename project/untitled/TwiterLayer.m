//
//  TwiterLayer.m
//  untitled
//



#import "AppDelegate.h"
#import "TwiterLayer.h"

@implementation TwiterLayer

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	TwiterLayer *layer = [TwiterLayer node];
	[scene addChild: layer];
	return scene;
}

-(id) init
{
	if( (self=[super init])) {
		
        //
		CGSize size = [[CCDirector sharedDirector] winSize];
        
        //add button
        item = [CCMenuItemFont itemFromString: @"-" target:self selector:@selector(onPress:)];
        item.position =  ccp( 0 , 0 );
        [item setFontName:@"Helvetica-Bold"];
        [item setFontSize:16];
        CCMenu *menu = [CCMenu menuWithItems:item ,nil];
        [self addChild: menu];
        
        //add label
		label = [CCLabelTTF labelWithString:@"-" fontName:@"Helvetica" fontSize:12];
		label.position =  ccp( size.width/2 , size.height/2 - 50 );
		[self addChild: label];
        
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"postToTwitter"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        app = (AppDelegate *)[UIApplication sharedApplication].delegate;
        
        //
        [self schedule:@selector(check:) interval: 1];
	}
	return self;
}

-(void) onPress:(id)sender
{
    [app twit:[NSString stringWithFormat: @"twit:%@", [NSDate date]]];
}

//ログイン、つぶやき状況を表示
- (void) check:(ccTime)dt
{
    int num = [[app twit:@""] intValue];
    
    //NSLog(@"%i", num);
    if(num == 2) {
        [item setString:@"TNX!"];
        [label setString:@"つぶやき完了"];
        [self unschedule:@selector(check:)];
    } else if(num == 1) {
        [item setString:@"TWIT!"];
        [label setString:@"ログイン中→つぶやきます"];
    } else {
        [item setString:@"LOGIN"];
        [label setString:@"ログイン前→認証画面表示"];
    }
}

-(void) dealloc
{
	[super dealloc];
}
@end
