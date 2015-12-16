
//
//  Created by Sachin on 14/12/15.
//  Copyright © 2015 SachinVsSachin. All rights reserved.
//

#import "STAlertController.h"
#import <objc/runtime.h>



@interface STAlertController ()

@property (nonatomic,copy) NSMutableArray *alertActionArray;

@property (strong, nonatomic) IBOutlet UIStackView *stackButtonView;

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) IBOutlet UILabel *messageLabel;

@property (weak, nonatomic) IBOutlet UIView *alertContainer;

@property (weak, nonatomic) IBOutlet UIView *shadowContainer;

@property (nonatomic,strong) NSString *alertTitle;

@property (nonatomic,strong) NSString *message;

@end

@implementation STAlertController


+ (id)initWithTitle:(NSString *)title message:(NSString *)message{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"STAlert" bundle:nil];
    STAlertController *vc = (STAlertController*)[storyboard instantiateViewControllerWithIdentifier:@"alertID"];
    vc.alertTitle = title;
    vc.message = message;
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    vc.providesPresentationContextTransitionStyle = YES;
    vc.definesPresentationContext = YES;
    [vc setModalPresentationStyle:UIModalPresentationOverCurrentContext];
    //default value
    vc.buttonStackAxis = UILayoutConstraintAxisHorizontal;
    return vc;
}


- (void)addAction:(STAlertAction*)alertAction{
    
    if (_alertActionArray == nil) {
        _alertActionArray = [NSMutableArray new];
    }
    alertAction.alertController = self;
    [_alertActionArray addObject:alertAction];
    
}




- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    _shadowContainer.layer.shadowColor = [[UIColor blackColor] CGColor];
    _shadowContainer.layer.shadowOpacity = 0.5;
    _shadowContainer.layer.shadowOffset = CGSizeMake(1, 1);
    _shadowContainer.layer.shadowRadius = 1.0;
    _shadowContainer.layer.cornerRadius = 8.0;
    _alertContainer.layer.cornerRadius = 8.0;
}


- (void)setup{
    _stackButtonView.axis  = _buttonStackAxis;
    for (STAlertAction *alertAction in _alertActionArray) {
        [_stackButtonView addArrangedSubview:alertAction.actionButton];
    }
    
    [_titleLabel setText:_alertTitle];
    [_messageLabel setText:_message];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end





#define  CANCEL_BUTTON_COLOR [UIColor lightGrayColor]
#define  SUBMIT_BUTTON_COLOR [UIColor grayColor]

@interface STAlertAction ()

@property (nonatomic,strong) NSString *title;

@end

@implementation STAlertAction

+ (id)actionWithType:(ACTION_TYPE)actionType andTitle:(NSString*)title CompletionHandler:(CompletionHandler )completionHandler{
    STAlertAction *alertAction = [[STAlertAction alloc] init];
    alertAction.completionHandler = completionHandler;
    alertAction.actionType = actionType;
    alertAction.title = title;
    return alertAction;
}



- (void)setup{
    if (_actionButton) {
        
    }else{
        _actionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_actionButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateSelected];
        [_actionButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        [_actionButton.heightAnchor constraintEqualToConstant:44].active = true;
    }
   
    _actionButton.backgroundColor = (_actionType == SUBMIT_TYPE)? SUBMIT_BUTTON_COLOR:CANCEL_BUTTON_COLOR;
    [_actionButton setTitle:_title forState:UIControlStateNormal];
    [_actionButton addTarget:self action:@selector(doAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)doAction:(id)sender{
    [_alertController dismissViewControllerAnimated:YES completion:^{
            _completionHandler();
    }];
}



#pragma mark - Setters methods

- (void)setActionType:(ACTION_TYPE)actionType{
    _actionType = actionType;
    [self setup];
}


- (void)setTitle:(NSString *)title{
    _title = title;
    [self setup];
}


- (void)setCompletionHandler:(CompletionHandler)completionHandler{
    _completionHandler = completionHandler;
    [self setup];
}



@end





