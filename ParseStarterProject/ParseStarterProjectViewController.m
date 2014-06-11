#import "ParseStarterProjectViewController.h"
#import <Parse/Parse.h>

@interface ParseStarterProjectViewController()
@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *email;

@end

@implementation ParseStarterProjectViewController
@synthesize firstName,lastName,email;

#pragma mark - UIViewController

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)saveData:(id)sender {
    
    NSString *firstNameString = firstName.text;
    NSString *lastNameString = lastName.text;
    NSString *emailString = email.text;
    
    PFObject *userData = [PFObject objectWithClassName:@"userData"];
    
    userData[@"firstName"] = firstNameString;
    userData[@"lastName"] = lastNameString;
    userData[@"email"] = emailString;
    
    [userData saveEventually:^(BOOL succeeded, NSError *error) {
        if (error){
            NSLog(@"%@", error.localizedDescription);
        }else{
            NSLog(@"Data saved successfully.");
        }
    }];
}
@end
