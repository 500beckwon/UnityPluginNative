//
//  TestManager.h
//  UnityiOSPlugin
//
//  Created by ByungHoon Ann on 2022/06/11.
//

#ifndef TestManager_h
#define TestManager_h

#import <UnityiOSPlugin/UnityiOSPlugin.h>
#import <UIKit/UIKit.h>

typedef void (*testAction)(void);
typedef void (*testMessage)(const char*);

@interface TestManager : NSObject
{
    testAction actionHandler;
    testMessage messageHandler;
}

@property (assign)testAction actionHandler;
@property (assign)testMessage messageHandler;

+ (TestManager*)sharedInstance;
- (id)init;
- (void)dealloc;

@end

#endif /* TestManager_h */
