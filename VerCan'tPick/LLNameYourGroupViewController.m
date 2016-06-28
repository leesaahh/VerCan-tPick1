//
//  LLNameYourGroupViewController.m
//  VerCan'tPick
//
//  Created by Flatiron School on 6/22/16.
//  Copyright © 2016 Lisa Lee. All rights reserved.
//

#import "LLNameYourGroupViewController.h"
#import "LLGroupChoiceOptionsTableViewController.h"
#import "YourGroupsDataStore.h"
#import "Group.h"
#import "ChoiceOption.h"
#import <CoreData/CoreData.h>

@interface LLNameYourGroupViewController ()

@property (weak, nonatomic) IBOutlet UITextField *groupNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *choiceOptionsTextField;

@property (strong, nonatomic) Group *groupToPass;

@end

@implementation LLNameYourGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"CreateYourGroup modal viewDidLoad");
    
    [self.groupNameTextField becomeFirstResponder];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    LLGroupChoiceOptionsTableViewController *groupChoicesTVC = segue.destinationViewController;
    
    groupChoicesTVC.group = self.groupToPass;
    
}

- (IBAction)doneTapped:(id)sender {
    
    
        YourGroupsDataStore *dataStore = [YourGroupsDataStore sharedDataStore];
        
        Group *newGroup = [NSEntityDescription insertNewObjectForEntityForName:@"Group" inManagedObjectContext:dataStore.managedObjectContext];
        
        newGroup.name = self.groupNameTextField.text;
        
        NSArray *names =[self.choiceOptionsTextField.text componentsSeparatedByString:@", "];
        
        
        for (NSString *name in names) {
            ChoiceOption *newChoice = [NSEntityDescription insertNewObjectForEntityForName:@"ChoiceOption" inManagedObjectContext:dataStore.managedObjectContext];
            newChoice.name = name;
            newChoice.isOn = YES;
            
            [newGroup addChoiceOptionsObject:newChoice];
        }
        
        self.groupToPass = newGroup;
        
        [dataStore saveContext];
    
    NSLog(@"done creating new group");
    
    [self dismissViewControllerAnimated:YES completion:^{
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"doneCreatingGroup"
                                                            object:nil];
    }];
    
    
    
    

}

@end
