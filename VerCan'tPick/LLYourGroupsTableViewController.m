//
//  LLYourGroupsTableViewController.m
//  VerCan'tPick
//
//  Created by Flatiron School on 6/22/16.
//  Copyright © 2016 Lisa Lee. All rights reserved.
//

#import "LLYourGroupsTableViewController.h"
#import "LLGroupChoiceOptionsTableViewController.h"
#import "YourGroupsDataStore.h"
#import "Group.h"
#import <CoreData/CoreData.h>

@interface LLYourGroupsTableViewController ()

@property (strong, nonatomic) NSArray *groups;

@property (strong, nonatomic) Group *groupToPass;

@end

@implementation LLYourGroupsTableViewController

-(void)fetchAllGroups{
    NSFetchRequest *fetchAllGroups = [NSFetchRequest fetchRequestWithEntityName:@"Group"];
    
    YourGroupsDataStore *dataStore = [YourGroupsDataStore sharedDataStore];
    
    self.groups = [dataStore.managedObjectContext executeFetchRequest:fetchAllGroups error:nil];
}

-(void)viewWillAppear:(BOOL)animated {
    [self fetchAllGroups];
    [self.tableView reloadData];
    NSLog(@"YourGroupsTVC viewWillAppear");
}

-(void)doneCreatingGroup: (NSNotification *)notification {
    [self fetchAllGroups];
    [self.tableView reloadData];
    NSLog(@"YourGroupsTVC doneCreatingGroup: a new group was added to TVC");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(doneCreatingGroup:)
                                                 name:@"doneCreatingGroup"
                                               object:nil];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    [self fetchAllGroups];
    
    return self.groups.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"groupCell" forIndexPath:indexPath];
    
    Group *group = self.groups[indexPath.row];
    
    cell.textLabel.text = group.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%li", group.choiceOptions.count];
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        YourGroupsDataStore *dataStore = [YourGroupsDataStore sharedDataStore];
        
        // Delete the group from the datastore
        [dataStore.managedObjectContext deleteObject:[self.groups objectAtIndex:indexPath.row]];
        
        // handle error
        NSError *error = nil;
        if (![dataStore.managedObjectContext save:&error]) {
            NSLog(@"Can't Delete! %@ %@", error, [error localizedDescription]);
            return;
        }

        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"yourGroupsSegue"]) {
        LLGroupChoiceOptionsTableViewController *groupChoicesTVC = segue.destinationViewController;
        groupChoicesTVC.group = self.groupToPass;
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Group *group = self.groups[indexPath.row];
    self.groupToPass = group;
    
   [self performSegueWithIdentifier:@"yourGroupsSegue" sender:self];
    NSLog(@"performing segue from didSelect");
}


@end
