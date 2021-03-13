#import "Window.h"


@implementation FloatingWindow

+(instancetype)sharedInstance {
    static FloatingWindow *sharedController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [[FloatingWindow alloc] init];
    });
    return sharedController;
}

-(id)init {

    self = [super initWithFrame:CGRectMake(100, 100, 200, 200)];
    self.backgroundColor = [UIColor blueColor];

    self.windowLevel = UIWindowLevelStatusBar + 1000;
    self.clipsToBounds = NO;
    self.userInteractionEnabled = YES;
    self.opaque = NO;
    self.layer.cornerRadius = 6;
    [self makeKeyAndVisible];

    return self;
}

@end

