//
//  ACAutoUnderlineTextField.h
//  ACAutoUnderlineTextFieldExample
//
//  Created by Albert Chu on 16/1/17.
//  Copyright © 2016年 ACSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ACAutoUnderlineTextField : UITextField

@property (nonatomic, assign) CGFloat   underlineHeight;

@property (nonatomic, strong) UIColor   *underlineColor;
@property (nonatomic, strong) UIColor   *underlinePlaceholderColor;

@end
