//
//  AppDelegate.m
//  AXOutliner
//
//  Created by Ariel Tyson on 27/3/26.
//

#import "AppDelegate.h"
#import "AXOTestObject.h"

@interface AppDelegate ()


@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // --- Object Lifecycle Exploration ---

    // 1. Basic creation
    AXOTestObject *root = [[AXOTestObject alloc] initWithName:@"Project"];
    NSLog(@"Created: %@", root);

    // 2. Adding children
    AXOTestObject *folderA = [[AXOTestObject alloc] initWithName:@"Design"];
    AXOTestObject *folderB = [[AXOTestObject alloc] initWithName:@"Engineering"];
    [root addChild:folderA];
    [root addChild:folderB];
    NSLog(@"Root now: %@", [root summary]);

    // 3. Nested children
    AXOTestObject *task = [[AXOTestObject alloc] initWithName:@"Fix VoiceOver labels"];
    [folderB addChild:task];
    NSLog(@"Engineering has %lu children", (unsigned long)folderB.children.count);

    // 4. Copy vs Strong — the critical lesson
    NSMutableString *mutableName = [NSMutableString stringWithString:@"Original"];
    AXOTestObject *copyTest = [[AXOTestObject alloc] initWithName:mutableName];
    [mutableName appendString:@" MODIFIED"];
    NSLog(@"Mutable string is now: '%@'", mutableName);
    NSLog(@"Object's name is still: '%@'", copyTest.name);
    // ↑ This proves why NSString properties use 'copy' — the object keeps
    //   its own snapshot, immune to external mutation

    // 5. Deallocation — watch the console
    @autoreleasepool {
        AXOTestObject *temporary = [[AXOTestObject alloc] initWithName:@"Temporary"];
        NSLog(@"Created temporary: %@", temporary);
        // When this @autoreleasepool scope ends, 'temporary' has no more
        // strong references, so ARC calls dealloc → you see the log
    }
    NSLog(@"After autoreleasepool — 'Temporary' should be deallocated above");

    // 6. nil safety — Objective-C doesn't crash on nil messages
    AXOTestObject *nothing = nil;
    NSLog(@"Calling summary on nil: '%@'", [nothing summary]);
    // ↑ Returns nil, no crash. This is different from every other language.
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}


@end
