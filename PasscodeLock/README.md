PasscodeLock
=========
##Intrudoction

This project shows you how to create a ***Passcode Lock*** window.

You can custom your own ***Passcode Lock*** view via **AbstractPasscodeLockViewController**

>p.s. This project is non-arc.

##How to use:

####Create "Passcode Lock" related view controllers

1. Create your PasscodeLock ViewControllers (You should have 3 ViewControllers for 1. Enable passcode lock, 2. Change passcode and 3. Verify passcode) by inheriting **AbstractPasscodeLockViewController**.  

2. Implement <code>- (void) onFilled:(NSString*) result </code> in each ViewControllers. <code>- (void) onFilled:(NSString*) result </code> will be called when user input 4 digits. This is where you can verify the passcode.

###Show "Passcode Lock" window

1. Create a instance of **PasscodeLockWindow** class at ***youAppNameAppDelegate***.  
```objc
@property (nonatomic, readwrite, retain) PasscodeLockWindow* passcodeLockWindow;
```

2. Using the method <code>[self.passcodeLockWindow show]</code> to show up the "Passcode Lock" window.
