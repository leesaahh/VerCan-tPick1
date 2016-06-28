//
//  ChoiceOption+CoreDataProperties.h
//  VerCan'tPick
//
//  Created by Flatiron School on 6/22/16.
//  Copyright © 2016 Lisa Lee. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ChoiceOption.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChoiceOption (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nonatomic) BOOL isOn;

@end

NS_ASSUME_NONNULL_END
