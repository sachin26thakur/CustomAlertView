//
//  STAlertController.h

//
//  Created by Sachin on 14/12/15.
//  Copyright © 2015 SachinVsSachin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class STAlertAction;

typedef void (^CompletionHandler)(void);

@interface STAlertController : UIViewController

@property (nonatomic,assign) UILayoutConstraintAxis buttonStackAxis;

+ (id)initWithTitle:(NSString *)title message:(NSString *)message;

- (void)addAction:(STAlertAction*)alertAction;

@end


typedef enum : NSUInteger {
    SUBMIT_TYPE,
    CANCEL_TYPE,
    OTHERS,
} ACTION_TYPE;

@interface STAlertAction: NSObject
@property (nonatomic,copy) CompletionHandler completionHandler;
@property (nonatomic,assign) ACTION_TYPE actionType;
@property (nonatomic,strong) UIButton *actionButton;
@property (nonatomic,weak) STAlertController *alertController;

+ (id)actionWithType:(ACTION_TYPE)actionType andTitle:(NSString*)title CompletionHandler:(CompletionHandler )completionHandler;

@end