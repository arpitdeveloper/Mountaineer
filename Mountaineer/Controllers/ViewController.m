//
//  ViewController.m
//  Mountaineer
//
//  Created by Apple on 02/03/19.
//  Copyright © 2019 Rajesh Shinde. All rights reserved.
//

#import "ViewController.h"
#import "TakePhotoController.h"
@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIButton *nextBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _nextBtn.layer.borderWidth = 1;
    [self.navigationController setNavigationBarHidden:YES];
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnAction:(id)sender {
    
    TakePhotoController *view = [self.storyboard instantiateViewControllerWithIdentifier:@"TakePhotoController"];
    [self.navigationController pushViewController:view animated:YES];
}

@end
