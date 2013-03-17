PasscodeLock
=========
##Intrudoction

This project shows you how to create a ***Passcode Lock***.

You can custom your own ***Passcode Lock*** view via **AbstractPasscodeLockViewController**

P.S. **This project is non-arc**

##How to use:

####Create "Passcode Lock" related view controllers

1. Create your PasscodeLock ViewControllers (You may have 3 ViewControllers for 1.enable passcode lock, 2.change passcode and 3.verify passcode) by inheriting **AbstractPasscodeLockViewController**.  

2. Implement <code>- (void) onFilled:(NSString*) result </code> in each ViewControllers. <code>- (void) onFilled:(NSString*) result </code> will be called when user input 4 digits. This is where you can verify the passcode.

###Show "Passcode Lock" view controller

1. Create a instance of **PasscodeLockWindow** class at ***youAppName***AppDelegate.  
```objc
@property (nonatomic, readwrite, retain) PasscodeLockWindow* passcodeLockWindow;
```

2. use method <code> [show] </code> to show up the "Passcode Lock"
