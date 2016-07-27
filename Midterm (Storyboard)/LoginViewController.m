//
//  LoginViewController.m
//  Midterm (Storyboard)
//
//  Created by Viviane Chan on 2016-07-25.
//  Copyright © 2016 LightHouse Labs. All rights reserved.
//

#import "LoginViewController.h"
#import "User.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UILabel *errorLabel;

@end

@implementation LoginViewController

//- (NSDictionary *) grabSavedLoginData {
//    
//    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    
//    self.appDelegate = appDelegate;
//    
//    
//    NSManagedObjectContext *moc = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
//    self.managedObjectContext = moc;
//    
//    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
//    
//    NSEntityDescription *userEntity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:self.managedObjectContext];
//    
//    [fetchRequest setEntity:userEntity];
//    
//    NSError *error = nil;
//    NSArray *userArray = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
//    NSMutableDictionary *userListDict = [NSMutableDictionary new];
//    
////    NSInteger userArrayCount = userArray.count;
//    for (User *user in userArray) {
//        [userListDict setValue:user.password forKey:user.userName];
//    }
//
//    return [userListDict copy];
//
//}
//
//- (BOOL) checkLoginCredentials {
//    
//    NSDictionary *userListDict = [self grabSavedLoginData];
//    
//    if ([userListDict.allKeys containsObject:self.usernameTextField.text]) {
//        
//        if ([userListDict[self.usernameTextField.text] isEqualToString:self.passwordTextField.text]) {
//            
//            return true;
//        }
//        return false;
//    }
//    return false;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self checkLoginCredentials];
    
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
