//
//  AppDelegate.h
//  everfreight
//
//  Created by Kyle Holsey on 7/5/16.
//  Copyright © 2016 Kyle Holsey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <Pushbots/Pushbots.h>
#import "AVFoundation/AVAudioPlayer.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (strong, nonatomic) Pushbots *PushbotsClient;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

