#import <UIKit/UIKit.h>
#import <MediaRemote/MediaRemote.h>
#import "Window.h"

@interface SpringBoard
@property FloatingWindow *floatingWindow;
@end

%hook SpringBoard

static FloatingWindow *floatingWindow = nil;

-(void)applicationDidFinishLaunching:(id)arg1 {

	[[NSNotificationCenter defaultCenter] addObserverForName:@"kMRMediaRemoteNowPlayingInfoDidChangeNotification" object:nil queue:nil usingBlock:^(NSNotification *note) { //CANT BE RUN RIGHT AWAY, OR THE VIEW GETS LOST DURING THE INITIALIZATION OF SPRINGBOARD 
		if (!floatingWindow) {
			dispatch_async(dispatch_get_main_queue(), ^{ //Must be on the main thread or will crash, because it's dealing with updating UI in a func that is normally multi-threaded!
				floatingWindow = [FloatingWindow sharedInstance];
			});
		}
	}];
	%orig;
}

%end