//
//  ViewController.m
//  ACAutoUnderlineTextFieldExample
//
//  Created by Albert Chu on 16/1/17.
//  Copyright © 2016年 ACSoft. All rights reserved.
//

#import "ViewController.h"
#import "ACAutoUnderlineTextField.h"


@interface ViewController ()

@property (nonatomic, strong) ACAutoUnderlineTextField *textField;

@end


@implementation ViewController

#pragma mark - Dealloc

- (void)dealloc {
    
}

#pragma mark - Init

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        // Custom initialization
        
        self.title = @"Example";
        
    }
    return self;
}

#pragma mark - Public


#pragma mark - View

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createSubviews];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

#pragma mark - Action


#pragma mark - Private

- (void)createSubviews {
    
    //-- textField
    CGRect textFieldFrame = CGRectMake(0.0,
                                       150.0,
                                       self.view.bounds.size.width,
                                       50.0);
    
    self.textField = [[ACAutoUnderlineTextField alloc] initWithFrame:textFieldFrame];
    
    self.textField.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    self.textField.font = [UIFont systemFontOfSize:24.0];
    
    UIColor *textColor = [UIColor colorWithRed:0/255.0 green:147/255.0 blue:255/255.0 alpha:1.0];
    self.textField.textColor = textColor;
    self.textField.underlineColor = textColor;
    self.textField.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:self.textField];
    
    
    self.textField.placeholder = @"input something";
    //----------------------------------------------------------------------------------------------//
    
}


@end
