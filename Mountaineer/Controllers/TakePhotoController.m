//
//  TakePhotoController.m
//  Mountaineer
//
//  Created by Apple on 02/03/19.
//  Copyright © 2019 Rajesh Shinde. All rights reserved.
//

#import "TakePhotoController.h"
#import "ViewPhotoController.h"

@interface TakePhotoController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    NSString *nextString;
}
@property (strong, nonatomic) IBOutlet UIButton *nextBtn;
@property (strong, nonatomic) IBOutlet UIImageView *imagePhoto;
@property (strong, nonatomic) IBOutlet UILabel *labelTake;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *leftConstan;

@end

@implementation TakePhotoController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];

    _nextBtn.layer.borderWidth = 1;
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Button Action

- (IBAction)btnAction:(id)sender {
  
    if (! [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
       
        
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"No Device"
                                                                       message:@"Camera is not available"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
        
        
    } else {
        
        ViewPhotoController *view = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewPhotoController"];
        [self.navigationController pushViewController:view animated:YES];
    }

}


@end
