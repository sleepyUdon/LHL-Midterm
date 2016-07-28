//
//  UserProfileViewController.m
//  Midterm (Storyboard)
//
//  Created by Viviane Chan on 2016-07-25.
//  Copyright © 2016 LightHouse Labs. All rights reserved.
//

#import "UserProfileViewController.h"
#import "UserProfileTableViewCell.h"
#import "AppDelegate.h"
#import "DummyDataManager.h"
#import "Dog.h"
#import "User.h"
#import "Event.h"
@import Photos;

@interface UserProfileViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate, UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
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


@property UITextField *activeField;

@property (strong,nonatomic) NSArray *dataArray;

@property (nonatomic) CGFloat scrollViewCenterConstant;

@property (strong, nonatomic)UIDatePicker *datePicker;

@property (weak, nonatomic) IBOutlet UIButton *cameraButton;


@end


@implementation UserProfileViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    //setup gender pickerview
    
    
    UIPickerView *pickerView = [[UIPickerView alloc] init];
    self.dataArray = @[@"Female",@"Male"];
    
    float screenWidth = [UIScreen mainScreen].bounds.size.width;
    float pickerWidth = screenWidth * 3 / 4;
    float xPoint = screenWidth / 2 - pickerWidth / 2;
    
    [pickerView setDataSource: self];
    [pickerView setDelegate: self];
    
    [pickerView setFrame: CGRectMake(xPoint, 0, pickerWidth, 100)];
    pickerView.backgroundColor = [UIColor whiteColor];
    pickerView.showsSelectionIndicator = YES;
    self.dogSexField.inputView = pickerView;
    
    //date picker
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    [datePicker addTarget:self action:@selector(onDatePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    self.dogBirthDateField.inputView = datePicker;
    
    //setup date picker
    
    self.datePicker = [[UIDatePicker alloc]init];
    [self.datePicker setDatePickerMode:UIDatePickerModeDate];
    [self.datePicker setDate:[NSDate date]];
    [self.datePicker addTarget:self action:@selector(onDatePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    self.dogBirthDateField.inputView = self.datePicker;
    
    
    
    // setup textfields
    
    self.dogNameField.delegate = self;
    self.dogBreedField.delegate = self;
    self.dogSexField.delegate = self;
    self.dogBirthDateField.delegate = self;
    self.dogOwnerField.delegate = self;
    self.dogDescriptionField.delegate = self;
    self.dogLocationField.delegate = self;
    self.dogUserNameField.delegate = self;
    self.dogPasswordField.delegate = self;
    
    
    //VIV CREATE MYUSER INFO
    
    self.dogPictureView.image = [UIImage imageNamed:@"squarefacedpoodle"];
    self.dogNameField.text = @"Ollie";
    self.dogBreedField.text = @"Poodle";
    self.dogSexField.text = @"Male";
    self.dogBirthDateField.text = @"12-08-2009"; //format?
    self.dogOwnerField.text =  @"Camille";
    self.dogDescriptionField.text = @"I think outside the box";
    self.dogLocationField.text = @"Guelph";
    self.dogUserNameField.text = @"MinecraftDog";
    self.dogPasswordField.text = @"Ursula";
    
    [self registerForKeyboardNotifications];
    
}

#pragma Date Picker - udpate textfield

- (void)onDatePickerValueChanged:(UIDatePicker *)sender {
    UIDatePicker *picker = [[UIDatePicker alloc]init];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-mm-dd"];
    self.dogBirthDateField.text = [dateFormatter stringFromDate:picker.date];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.dogOwnerField) {
        [textField resignFirstResponder];
        [self.dogDescriptionField becomeFirstResponder];
        
    }  else if (textField == self.dogDescriptionField) {
        [textField resignFirstResponder];
        [self.dogLocationField becomeFirstResponder];
        
        
    }  else if (textField == self.dogLocationField) {
        [textField resignFirstResponder];
        [self.dogUserNameField becomeFirstResponder];
    }  else if (textField == self.dogUserNameField) {
        [textField resignFirstResponder];
        [self.dogPasswordField becomeFirstResponder];
    }
    return YES;
}



#pragma gender picker - datasource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 2;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [self.dataArray objectAtIndex: row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.dogSexField.text = [self.dataArray objectAtIndex:row];
}



#pragma SetupKeyboard

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    self.activeField = textField;
}

- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
    
    // If active text field is hidden by keyboard, scroll it so it's visible
    // Your application might not need or want this behavior.
    CGRect aRect = self.view.frame;
    aRect.size.height -= kbSize.height;
    if (!CGRectContainsPoint(aRect, self.activeField.frame.origin) ) {
        CGPoint scrollPoint = CGPointMake(0.0, self.activeField.frame.origin.y-kbSize.height +10);
        [self.scrollView setContentOffset:scrollPoint animated:YES];
    }
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.activeField = nil;
}


#pragma button: Save Profile

- (IBAction)saveProfile:(id)sender {
    Dog *dog = [NSEntityDescription insertNewObjectForEntityForName:@"Dog" inManagedObjectContext:self.managedObjectContext];
    
    //    dog.dogPicture = self.dogPictureView.image;
    
    dog.dogName = self.dogNameField.text;
    dog.dogGender = self.dogSexField.text;
    dog.dogBOD = self.datePicker.date;
    dog.dogOwner = self.dogOwnerField.text;
    dog.dogDescription = self.dogDescriptionField.text;
    dog.dogLocation = self.dogUserNameField.text;
    dog.dogDescription = self.dogUserNameField.text;
    
    User *user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:self.managedObjectContext];
    
    user.userName = self. dogUserNameField.text;
    user.password = self.dogPasswordField.text;
    
    
    NSError *error = nil;
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"error saving: %@", error.localizedDescription);
    }
}


#pragma upload Picture

- (IBAction)takePhoto:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:nil];
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.dogPictureView.hidden = NO;
    self.dogPictureView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:nil];
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

