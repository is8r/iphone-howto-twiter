//
//  TwiterLayer.h
//  untitled
//

#import "cocos2d.h"

@interface TwiterLayer : CCLayer
{
    AppDelegate* app;
    CCLabelTTF *label;
    CCMenuItemFont *item;
}

+(CCScene *) scene;

@end
