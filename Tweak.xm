#import <UIKit/UIKit.h>
#import <MediaRemote/MediaRemote.h>
#import "Window.h"

@interface SpringBoard
@property FloatingWindow *floatingWindow;
@end

%hook SpringBoard

static FloatingWindow *floatingWindow = nil;

-(void)applicationDidFinishLaunching:(id)arg1 {

	[[NSNotificationCenter defaultCenter] addObserverForName:@"kMRMediaRemoteNowPlayingInfoDidChangeNotification" object:nil queue:nil usingBlock:^(NSNotification *note) { //CANT BE RUN RIGHT AWAY, 
		if (!floatingWindow) {
			dispatch_async(dispatch_get_main_queue(), ^{ //Must be on the main thread or will crash!
				floatingWindow = [FloatingWindow sharedInstance];
			});
		}
	}];

	
}

%end