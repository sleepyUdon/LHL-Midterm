//
//  SignUpViewController.m
//  Midterm (Storyboard)
//
//  Created by Viviane Chan on 2016-07-25.
//  Copyright © 2016 LightHouse Labs. All rights reserved.
//

#import "SignUpViewController.h"
#import "AppDelegate.h"
#import "DummyDataManager.h"
#import "Dog.h"
#import "User.h"
#import "Event.h"
@import Photos;



@interface SignUpViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate, UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>

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

@property (weak, nonatomic) IBOutlet UILabel *errorMessageLabel;

@property (nonatomic) CGFloat scrollViewCenterConstant;


@end


@implementation SignUpViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIPickerView *picker = [[UIPickerView alloc] init];
    // Init the data array.
    dataArray = [[NSMutableArray alloc] init];
    
    // Add some data for demo purposes.
    [dataArray addObject:@"One"];
    [dataArray addObject:@"Two"];
    [dataArray addObject:@"Three"];
    [dataArray addObject:@"Four"];
    [dataArray addObject:@"Five"];
    
    // Calculate the screen's width.
    float screenWidth = [UIScreen mainScreen].bounds.size.width;
    float pickerWidth = screenWidth * 3 / 4;
    
    // Calculate the starting x coordinate.
    float xPoint = screenWidth / 2 - pickerWidth / 2;
    
    // Init the picker view.
    pickerView = [[UIPickerView alloc] init];
    
    // Set the delegate and datasource. Don't expect picker view to work
    // correctly if you don't set it.
    [pickerView setDataSource: self];
    [pickerView setDelegate: self];
    
    // Set the picker's frame. We set the y coordinate to 50px.
    [pickerView setFrame: CGRectMake(xPoint, 50.0f, pickerWidth, 200.0f)];
    
    // Before we add the picker view to our view, let's do a couple more
    // things. First, let the selection indicator (that line inside the
    // picker view that highlights your selection) to be shown.
    pickerView.showsSelectionIndicator = YES;
    
    // Allow us to pre-select the third option in the pickerView.
    [pickerView selectRow:2 inComponent:0 animated:YES];
    
    // OK, we are ready. Add the picker in our view.
    [self.view addSubview: pickerView];


    self.dogNameField.delegate = self;
    self.dogBreedField.delegate = self;
    self.dogSexField.delegate = self;
    self.dogBirthDateField.delegate = self;
    self.dogOwnerField.delegate = self;
    self.dogDescriptionField.delegate = self;
    self.dogLocationField.delegate = self;
    self.dogUserNameField.delegate = self;
    self.dogPasswordField.delegate = self;
    
    [self registerForKeyboardNotifications];

}


#pragma Setup Picker

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 1;
}

#pragma SetupTextfield




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


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}



#pragma button: Save Profile

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
