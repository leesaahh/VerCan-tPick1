//
//  LLShakeToChooseViewController.h
//  VerCan'tPick
//
//  Created by Flatiron School on 6/22/16.
//  Copyright © 2016 Lisa Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Group.h"

@interface LLShakeToChooseViewController : UIViewController

@property (strong, nonatomic) Group *group;
@property (assign,nonatomic) NSInteger numberToChoose;

@property (weak, nonatomic) IBOutlet UIPickerView *choiceOptionPicker;

@end
