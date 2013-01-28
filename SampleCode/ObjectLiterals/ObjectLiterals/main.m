//
//  main.m
//  ObjectLiterals
//
//  Created by Huang ChienShuo on 10/26/12.
//  Copyright (c) 2012 Home. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        
        NSNumber *boolYES = @YES;
        NSNumber *boolNO  = @NO;
        NSNumber *charX = @'X';
        NSNumber *fortySevenInt = @47;
        NSNumber *fortySevenUnsigned = @47U;
        NSNumber *fortySevenLong = @47L;
        NSNumber *goldenRatioFloat = @1.61803F;
        NSNumber *goldenRatioDouble = @1.61803;
        
        NSLog(@"boolYes = %@", boolYES);
        NSLog(@"boolNO = %@", boolNO);
        NSLog(@"charX = %@", charX);
        NSLog(@"fortySevenInt = %@", fortySevenInt);
        NSLog(@"fortySevenUnsigned = %@", fortySevenUnsigned);
        NSLog(@"fortySevenLong = %@", fortySevenLong);
        NSLog(@"goldenRatioFloat = %@", goldenRatioFloat);
        NSLog(@"goldenRatioDouble = %@", goldenRatioDouble);
        
//        NSArray *instruments = [NSArray arrayWithObjects: @"Ocarina", @"Flute", @"Harp", nil];
        
        NSArray *instruments = @[ @"Ocarina  6", @"Flute", @"Harp" ];
        
        NSLog(@"instruments = %@", instruments);
        
        NSMutableArray *instrumentsMutable = [ @[ @"Ocarina", @"Flute", @"Harp" ] mutableCopy];
        
        NSLog(@"instrumentsMutable = %@", instrumentsMutable);
        
        
        //Dictionary
//        NSArray *keys   = [NSArray arrayWithObjects:@"Character", @"Weapon", @"Hitpoints", nil];
//        
//        NSArray *objects = [NSArray arrayWithObjects:@"Zelda", @"Sword", [NSNumber numberWithInt:50], nil];
//        
//        NSDictionary *stats = [NSDictionary dictionaryWithObjects:objects forKeys:keys];

        //Another version
//        NSDictionary *stats = [NSDictionary dictionaryWithObjectsAndKeys:
//                               @"Zelda", @"Character",
//                               @"Sword", @"Weapon",
//                               [NSNumber numberWithInt:50], @"Hitpoints",
//                               nil];
        
        NSDictionary *stats = @{    @"Character" : @"Zelda",
                                    @"Weapon" : @"Sword",
                                    @"Hitpoints" : @50};

        NSLog(@"stats = %@", stats);
        
//        NSString *instrument = [instruments objectAtIndex:0];
//        NSString *name = [stats objectForKey:@"Character"];
        
        NSString *instrument = instruments[0];
        NSString *name = stats[@"Character"];
        
        NSLog(@"instrument = %@", instrument);
        NSLog(@"name = %@", name);

        instrumentsMutable[0] = @"Ocarina of Time";
        NSLog(@"instrumentsMutable[0]  = %@",instrumentsMutable[0] );
        
        NSMutableDictionary *statsMutable = [[NSMutableDictionary alloc] initWithDictionary:stats];
        
        statsMutable[@"Weapon"] = @"Hammer";
        
        NSLog(@"instrumentsMutable = %@", instrumentsMutable);
        NSLog(@"statsMutable = %@", statsMutable);
        
        NSNumber *diameter = @(2 * 3.14 * 30);
        
        NSLog(@"diameter = %@", diameter);
        
        typedef enum { Sword, Hammer, Shield, Arrow } Weapons;
        
        NSNumber *currentWeapon = @(Sword);
        
        NSLog(@"currentWeapon = %@", currentWeapon);
        
        NSLog(@"instruments[0] = %@", [instruments objectAtIndexedSubscript:0]);

        
    }
    return 0;
}

