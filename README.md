# windowexample
Simplified floating window example

IMPORTANT NOTES
 - Always ensure that the window has not already been initialized before resetting it. Funcs like applicationDidFinishLaunching only run once, but still!
 - Make sure you update your UI(setting windows) on the main thread
 - And finally, the 
 
 floatingWindow = [FloatingWindow sharedInstance]
 
 is in a Notification because it shouldn't be run immediately, or it sometimes gets lost in the mumble jumble of initiating the SpringBoard. May not have this issue in other hooked functions. 
