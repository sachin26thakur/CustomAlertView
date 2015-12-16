//
//  ViewController.m
//  STAlertView
//
//  Created by Sachin on 14/12/15.
//  Copyright © 2015 SachinVsSachin. All rights reserved.
//

#import "ViewController.h"
#import "STAlertController.h"


@interface ViewController ()

@property (nonatomic,assign) UILayoutConstraintAxis buttonStackAxis;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _buttonStackAxis = UILayoutConstraintAxisHorizontal;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)doAction:(id)sender {
    
    
    NSString *title = @"Alert Title";
    NSString *message = @"Here you can place alert messages";
    
    STAlertController *alert  = [STAlertController  initWithTitle:title message:message];
    alert.buttonStackAxis = _buttonStackAxis;
    
    STAlertAction *alertAction1 = [STAlertAction actionWithType:CANCEL_TYPE andTitle:@"Cancel" CompletionHandler:^() {
        NSLog(@"alertAction1");
    }];
    
    STAlertAction *alertAction2 = [STAlertAction actionWithType:SUBMIT_TYPE andTitle:@"Okay" CompletionHandler:^() {
        NSLog(@"alertAction2");
    }];
    
    
    [alert addAction:alertAction1];
    [alert addAction:alertAction2];
    
    [self presentViewController:alert animated:YES completion:^{

    }];
}



- (IBAction)segmentBarValueChanged:(UISegmentedControl*)sender {
    
    if(sender.selectedSegmentIndex == 0){
        _buttonStackAxis = UILayoutConstraintAxisHorizontal;
    }else{
        _buttonStackAxis = UILayoutConstraintAxisVertical;
    }
}








@end




















