//
//  PBViewController.m
//  PandoraBox
//
//  Created by zhangpeng on 06/19/2019.
//  Copyright (c) 2019 zhangpeng. All rights reserved.
//

#import "PBViewController.h"
#import <PandoraBox/PBTimerManager.h>

@interface PBViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@end

@implementation PBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (IBAction)clickStartButton:(id)sender {
    __weak typeof(self) weakSelf = self;
    [[PBTimerManager sharedInstance] pb_scheduledTimerWithName:_textField.text interval:1 queue:nil repeat:YES action:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"%@", [NSString stringWithFormat:@"--- %@ %@ ---", [NSThread currentThread], weakSelf.textField.text]);
        });
    }];
    [[PBTimerManager sharedInstance] pb_startTimerWithName:_textField.text];
}

- (IBAction)clickStopButton:(id)sender {
    [[PBTimerManager sharedInstance] pb_stopTimerWithName:_textField.text];
    NSLog(@"%@", [[PBTimerManager sharedInstance] pb_getAllTimers]);
}

- (IBAction)clickSuspendButton:(id)sender {
    [[PBTimerManager sharedInstance] pb_suspendTimerWithName:_textField.text];
    NSLog(@"%@", [[PBTimerManager sharedInstance] pb_getAllTimers]);
}

- (IBAction)clickResumeButton:(id)sender {
    [[PBTimerManager sharedInstance] pb_resumeTimerWithName:_textField.text];
    NSLog(@"%@", [[PBTimerManager sharedInstance] pb_getAllTimers]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
