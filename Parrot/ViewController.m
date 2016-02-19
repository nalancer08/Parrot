//
//  ViewController.m
//  Parrot
//
//  Created by Webchimp on 19/02/16.
//  Copyright © 2016 Webchimp. All rights reserved.
//

#import "ViewController.h"
//#import "Parrot.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    
    //[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor redColor];
   Parrot *uno = [[Parrot alloc] init];
    
    uno.frame = CGRectMake(10, 100, 240, 40);
    
    [uno setData];
    [self.view addSubview:uno.text];
    
    /*UITextField *la = [[UITextField alloc] init];
    la.frame = CGRectMake(15, 300, 240, 40);
    [self.view addSubview:la];
    
    la.backgroundColor = [UIColor greenColor];*/
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
