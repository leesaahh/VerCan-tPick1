//
//  LLShakeToChooseViewController.m
//  VerCan'tPick
//
//  Created by Flatiron School on 6/22/16.
//  Copyright © 2016 Lisa Lee. All rights reserved.
//

#import "LLShakeToChooseViewController.h"
#import "ChoiceOption.h"
#import <CoreMotion/CoreMotion.h>

@interface LLShakeToChooseViewController () <UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong,nonatomic) NSMutableArray *chosenOnes;
@property (strong,nonatomic) NSMutableArray *displayInPicker;

-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event;

@end

@implementation LLShakeToChooseViewController

-(void)viewWillAppear:(BOOL)animated{
    self.displayInPicker = [[NSMutableArray alloc]init];
    
    for (ChoiceOption *choice in self.group.choiceOptions) {
        if (!choice.isOn) {
            continue;
        } else {
            [self.displayInPicker addObject:choice.name];
        }
    }
    NSLog(@"Display in picker: %@", self.displayInPicker);
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.chosenOnes = [[NSMutableArray alloc]init];
    
    self.choiceOptionPicker.delegate = self;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.displayInPicker.count;
}
;
-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    return 70;
}

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel *currentLabel = [[UILabel alloc]init];
    currentLabel.text = self.displayInPicker[row];
    return currentLabel;
}

-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    NSLog(@"shake began");
    
    NSInteger randomRow = arc4random() %(self.displayInPicker.count-1);
    [self.choiceOptionPicker selectRow:randomRow inComponent:0 animated:YES];

    NSLog(@"Chosen Choice: %@",self.displayInPicker[randomRow]);
    
    [self.chosenOnes addObject:self.displayInPicker[randomRow]];
    
    NSLog(@"Chosen Ones: %@",self.chosenOnes);

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
