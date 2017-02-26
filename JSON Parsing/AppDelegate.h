//
//  AppDelegate.h
//  JSON Parsing
//
//  Created by Raj Dhakate on 06/02/17.
//  Copyright © 2017 CodeBlood. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

