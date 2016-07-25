//
//  SignUpViewController.m
//  Midterm (Storyboard)
//
//  Created by Viviane Chan on 2016-07-25.
//  Copyright © 2016 LightHouse Labs. All rights reserved.
//

#import "SignUpViewController.h"
#import "AppDelegate.h"
#import "Dog.h"
#import "User.h"
@import Photos;



@interface SignUpViewController ()<UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *dogPictureView;

@property (weak, nonatomic) IBOutlet UITextField *dogNameField;
@property (weak, nonatomic) IBOutlet UITextField *dogBreedField;
@property (weak, nonatomic) IBOutlet UITextField *dogSexField;
@property (weak, nonatomic) IBOutlet UITextField *dogBirthDateField;
@property (weak, nonatomic) IBOutlet UITextField *dogOwnerField;
@property (weak, nonatomic) IBOutlet UITextField *dogDescriptionField;
@property (weak, nonatomic) IBOutlet UITextField *dogLocationField;
@property (weak, nonatomic) IBOutlet UITextField *dogUserNameField;
@property (weak, nonatomic) IBOutlet UITextField *dogPasswordField;

@property (weak, nonatomic) IBOutlet UILabel *errorMessageLabel;

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}




#pragma button: SAVE PROFILE

- (IBAction)saveProfile:(id)sender {
    Dog *dog = [NSEntityDescription insertNewObjectForEntityForName:@"Dog" inManagedObjectContext:self.managedObjectContext];
    
//    dog.dogPicture = self.dogPictureView.image;
    dog.dogName = self.dogNameField.text;
    dog.dogGender = self.dogSexField.text;
    

// date picker

    dog.dogOwner = self.dogOwnerField.text;
    dog.dogDescription = self.dogDescriptionField.text;
    dog.dogLocation = self.dogUserNameField.text;
    dog.dogDescription = self.dogUserNameField.text;
    
    User *user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:self.managedObjectContext];

    user.userName = self. dogUserNameField.text;
    user.password = self.dogPasswordField.text;
    
    
    NSError *error = nil;
    
    [self.navigationController popViewControllerAnimated:YES];
    
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"error saving: %@", error.localizedDescription);
    }
}

#pragma mark - Checking Photo Library Authorization

- (BOOL)photolibraryAuthorizationStatus {
    PHAuthorizationStatus authStatus = [PHPhotoLibrary authorizationStatus];
    switch (authStatus) {
        case PHAuthorizationStatusAuthorized:
            return YES;
        case PHAuthorizationStatusNotDetermined: {
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                [self photolibraryAuthorizationStatus];
            }];
        }
            return NO;
        case PHAuthorizationStatusDenied:
            // fires if the user denies system attempt to authorize photo library
            [self alertUserWithMessage:@"This App Requires PhotoLibary Access To Work."];
            return NO;
        case PHAuthorizationStatusRestricted:
            return NO;
    }
}


- (void)alertUserWithMessage:(NSString *)message {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Authorization" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // I'm taking the user to the Device settings when they hit OK
        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        [[UIApplication sharedApplication] openURL:url];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Cancel Tapped");
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}


#pragma mark - Camera Access Authorization

- (BOOL)cameraAccessAuthorizationStatus {
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    switch (authStatus) {
        case AVAuthorizationStatusAuthorized:
            NSLog(@"Camera authorized");
            return YES;
        case AVAuthorizationStatusRestricted:
            NSLog(@"Camera restricted");
            return NO;
        case AVAuthorizationStatusNotDetermined:
            NSLog(@"Camera status not determined");
            [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
            return NO;
        case AVAuthorizationStatusDenied:
            NSLog(@"Camera status denied");
            [self alertUserWithMessage:@"This App Requires Authorization To Use Your Camera"];
            return NO;
    }
}


#pragma button: Pick Picture


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:NULL];
     self.dogPictureView.image = info[UIImagePickerControllerOriginalImage];
    
    NSString* imageName = [NSString stringWithFormat:(@"%@picture",self.dogUserNameField.text)];
    UIImage *dogImage = [UIImage imageNamed:imageName];
    Dog *dog = [[Dog alloc]init];
    dog.dogPicture = UIImageJPEGRepresentation(dogImage, 1.0);
    
//    [newManagedObject setValue:imageData forKey:@"image"];

}














- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
