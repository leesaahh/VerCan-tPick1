//
//  Group+CoreDataProperties.h
//  VerCan'tPick
//
//  Created by Flatiron School on 6/22/16.
//  Copyright © 2016 Lisa Lee. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Group.h"

NS_ASSUME_NONNULL_BEGIN

@interface Group (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSOrderedSet<ChoiceOption *> *choiceOptions;

@end

@interface Group (CoreDataGeneratedAccessors)

- (void)insertObject:(ChoiceOption *)value inChoiceOptionsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromChoiceOptionsAtIndex:(NSUInteger)idx;
- (void)insertChoiceOptions:(NSArray<ChoiceOption *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeChoiceOptionsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInChoiceOptionsAtIndex:(NSUInteger)idx withObject:(ChoiceOption *)value;
- (void)replaceChoiceOptionsAtIndexes:(NSIndexSet *)indexes withChoiceOptions:(NSArray<ChoiceOption *> *)values;
- (void)addChoiceOptionsObject:(ChoiceOption *)value;
- (void)removeChoiceOptionsObject:(ChoiceOption *)value;
- (void)addChoiceOptions:(NSOrderedSet<ChoiceOption *> *)values;
- (void)removeChoiceOptions:(NSOrderedSet<ChoiceOption *> *)values;

@end

NS_ASSUME_NONNULL_END
