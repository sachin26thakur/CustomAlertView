# CustomAlertView


![alt tag] (https://raw.githubusercontent.com/sachin26thakur/CustomAlertView/master/STAlertView/STAlert.gif)


# Usage:

Add STAlert folder inside of your project and import file STAlertController.h where do want to use and do this way.

    
    
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
