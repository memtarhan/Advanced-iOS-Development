//
//  ViewController.m
//  MyCompany
//
//  Created by Mehmet Tarhan on 20/02/2022.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)showName:(id)sender {
    [self.nameLabel setText:@"My name is Objective-C"];
}

@end
