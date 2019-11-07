//
//  ViewPhotoController.m
//  Mountaineer
//
//  Created by Apple on 02/03/19.
//  Copyright © 2019 Rajesh Shinde. All rights reserved.
//

#import "ViewPhotoController.h"
#import "TakePhotoController.h"

@interface ViewPhotoController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (strong, nonatomic) IBOutlet UIButton *returnBtn;
@property (strong, nonatomic) IBOutlet UILabel *label1;
@property (strong, nonatomic) IBOutlet UILabel *label2;
@property (strong, nonatomic) IBOutlet UILabel *label3;
@property (strong, nonatomic) IBOutlet UILabel *label31;
@property (strong, nonatomic) IBOutlet UILabel *label4;
@property (strong, nonatomic) IBOutlet UILabel *label41;
@property (strong, nonatomic) IBOutlet UILabel *label5;
@property (strong, nonatomic) IBOutlet UILabel *label51;
@property (strong, nonatomic) IBOutlet UILabel *label6;
@property (strong, nonatomic) IBOutlet UILabel *label61;
@property (strong, nonatomic) IBOutlet UITextView *text1;
@property (strong, nonatomic) IBOutlet UIView *view1;
@property (strong, nonatomic) IBOutlet UIView *view2;

@end


@implementation ViewPhotoController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _returnBtn.layer.borderWidth = 1;
    
    [self.navigationController setNavigationBarHidden:YES];

    UIImagePickerController* controller = [[UIImagePickerController alloc] init];
    controller.sourceType = UIImagePickerControllerSourceTypeCamera;
    controller.delegate = self;
    controller.allowsEditing = YES;
    [self presentViewController:controller animated:NO completion:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - BUTTON ACTION

- (IBAction)returnAction:(id)sender {
    
    TakePhotoController *view = [self.storyboard instantiateViewControllerWithIdentifier:@"TakePhotoController"];
    [self.navigationController pushViewController:view animated:YES];
    
}

#pragma mark - IMAGE PICKER MATHOD

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    [_imageview setImage:chosenImage];
    [picker dismissViewControllerAnimated:YES completion:NULL];

    [[picker parentViewController] dismissViewControllerAnimated:YES completion:^{
        
        NSLog(@"Dismisssss");
    }];
    
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    [self.navigationController popViewControllerAnimated:NO];
    
}
@end


