// Header
#import "RCCAppDelegate.h"

@implementation RCCAppDelegate

- (BOOL)application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSMutableArray *tempImages = [NSMutableArray new];
    for (NSUInteger index = 0; index < 26; index ++) {
        NSString *imageName = [NSString stringWithFormat:@"Thumb%03ld.jpg", (unsigned long)index];
        UIImage *image = [UIImage imageNamed:imageName];
        [tempImages addObject:image];
    }
    
    _images = [NSArray arrayWithArray:tempImages];
    
    // Present window
    [self.window makeKeyAndVisible];
    // Finished
    return YES;
}

@end
