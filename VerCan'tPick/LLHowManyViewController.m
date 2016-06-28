//
//  LLHowManyViewController.m
//  VerCan'tPick
//
//  Created by Flatiron School on 6/22/16.
//  Copyright © 2016 Lisa Lee. All rights reserved.
//

#import "LLHowManyViewController.h"
#import "LLShakeToChooseViewController.h"

@interface LLHowManyViewController ()
@property (weak, nonatomic) IBOutlet UILabel *qtyLabel;
@property (weak, nonatomic) IBOutlet UIStepper *qtyStepper;

@end

@implementation LLHowManyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.qtyLabel.text = [NSString stringWithFormat:@"%lu", (NSUInteger)self.qtyStepper.value];
    
    self.navigationItem.rightBarButtonItem.enabled = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)qtyStepperTapped:(id)sender {
    
    self.navigationItem.rightBarButtonItem.enabled = YES;
    
    self.qtyLabel.text = [NSString stringWithFormat:@"%lu", (NSUInteger)self.qtyStepper.value];
}




#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    LLShakeToChooseViewController *shakeToChooseVC = segue.destinationViewController;
    
    shakeToChooseVC.group = self.group;
}


@end
