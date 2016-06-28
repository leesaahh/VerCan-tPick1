//
//  LLGroupChoiceOptionsTableViewController.m
//  VerCan'tPick
//
//  Created by Flatiron School on 6/22/16.
//  Copyright © 2016 Lisa Lee. All rights reserved.
//

#import "LLGroupChoiceOptionsTableViewController.h"
#import "LLChoiceOptionTableViewCell.h"
#import "LLHowManyViewController.h"
#import "YourGroupsDataStore.h"
#import "ChoiceOption.h"
#import <CoreData/CoreData.h>

@interface LLGroupChoiceOptionsTableViewController ()

@end

@implementation LLGroupChoiceOptionsTableViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"GroupChoiceVC viewDidLoad");
    
    self.navigationItem.title = self.group.name;
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ChoiceOption *currentChoice = self.group.choiceOptions[indexPath.row];
    currentChoice.isOn = (!currentChoice.isOn);
    
    LLChoiceOptionTableViewCell *selectedCell = [self.tableView cellForRowAtIndexPath:indexPath];
    [selectedCell.isOnSwitch setOn:currentChoice.isOn];
    
    NSLog(@"%@ is %@ on",currentChoice.name, currentChoice.isOn ? @"YES" : @"NO");
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.group.choiceOptions.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LLChoiceOptionTableViewCell
    *cell = [tableView dequeueReusableCellWithIdentifier:@"choiceOptionCell" forIndexPath:indexPath];
    
    ChoiceOption *choiceOption = self.group.choiceOptions[indexPath.row];
    
    cell.choiceNameLabel.text = choiceOption.name;
    cell.isOnSwitch.on = choiceOption.isOn;
    
    [cell.isOnSwitch addTarget:self
                 action:@selector(tableView:didSelectRowAtIndexPath:)
       forControlEvents:UIControlEventValueChanged];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    
    LLHowManyViewController *howManyVC = segue.destinationViewController;
    howManyVC.group = self.group;
}


@end
