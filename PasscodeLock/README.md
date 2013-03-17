PasscodeLock
=========
##Intrudoction

This project shows you how to create a ***Passcode Lock*** and it's not a library.

You can custom your own ***Passcode Lock** view ***via AbstractPasscodeLockViewController***

**This project is non-arc**

##How to use:
1. Create your PasscodeLock ViewControllers (You may have 3 ViewControllers for enable passcode lock, change passcode and verify passcode) by inheriting ***AbstractPasscodeLockViewController***.  

2. Implement <code>- (void) onFilled:(NSString*) result </code> in each ViewControllers. <code>- (void) onFilled:(NSString*) result </code> will be called when user input 4 digits.

3. 

