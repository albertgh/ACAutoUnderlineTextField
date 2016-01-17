//
//  ACAutoUnderlineTextField.m
//  ACAutoUnderlineTextFieldExample
//
//  Created by Albert Chu on 16/1/17.
//  Copyright © 2016年 ACSoft. All rights reserved.
//

#import "ACAutoUnderlineTextField.h"


@interface ACAutoUnderlineTextField ()

@property (nonatomic, strong) UIView        *underlineView;

@property (nonatomic, copy) NSString        *currentText;

@property (nonatomic, strong) UITextField   *underlineWidthHelper;

@end


@implementation ACAutoUnderlineTextField

#pragma mark - Dealloc

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Init

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initialize];
    }
    return self;
}

#pragma mark - Public

#pragma mark - View

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self updateLayout];
}

#pragma mark - Action

#pragma mark - Observer

- (void)textFieldDidChange:(NSNotification *)notification {
    UITextField *textField = (UITextField *)notification.object;
    if (textField == self) {
        self.currentText = textField.text;
        //NSLog(@"%@", textField.text);
        if (textField.text.length > 0) {
            [self showUnderline];
        }
        else {
            [self showPlaceholderUnderline];
        }
    }
}

#pragma mark - Private

- (void)updateLayout {
    if (self.currentText.length > 0) {
        [self showUnderline];
    }
    else {
        [self showPlaceholderUnderline];
    }
}

- (void)initialize {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textFieldDidChange:)
                                                 name:UITextFieldTextDidChangeNotification
                                               object:self];
    
    
    //-- underLineView
    self.underlineView = [[UIView alloc] initWithFrame:CGRectZero];
    [self addSubview:self.underlineView];
    
    // default style
    self.underlineHeight = 1.0;
    self.underlineColor = [UIColor colorWithRed:0/255.0 green:147/255.0 blue:255/255.0 alpha:1.0];
    self.underlinePlaceholderColor = [UIColor colorWithRed:187/255.0 green:187/255.0 blue:193/255.0 alpha:1.0];
    //----------------------------------------------------------------------------------------------//
    
    
    //-- underlineWidthHelper
    self.underlineWidthHelper = [[UITextField alloc] initWithFrame:CGRectZero];
    self.underlineWidthHelper.textAlignment = NSTextAlignmentCenter;
    //----------------------------------------------------------------------------------------------//
}

- (void)showUnderline {
    CGFloat underlineWidth = [self underlineWidth];
    CGRect underlineFrame = CGRectMake(((self.bounds.size.width - underlineWidth) / 2.0),
                                       self.bounds.size.height - self.underlineHeight,
                                       underlineWidth,
                                       self.underlineHeight);
    self.underlineView.frame = underlineFrame;
    self.underlineView.backgroundColor = self.underlineColor;
}

- (void)showPlaceholderUnderline {
    CGFloat underlineWidth = [self underlineWidth];
    CGRect underlineFrame = CGRectMake(((self.bounds.size.width - underlineWidth) / 2.0),
                                       self.bounds.size.height - self.underlineHeight,
                                       underlineWidth,
                                       self.underlineHeight);
    self.underlineView.frame = underlineFrame;
    self.underlineView.backgroundColor = self.underlinePlaceholderColor;
}

- (CGFloat)underlineWidth {
    self.underlineWidthHelper.font = self.font;

    self.underlineWidthHelper.text = self.currentText;
    if (self.currentText.length < 1) {
        if (self.placeholder.length > 0) {
            self.underlineWidthHelper.text = self.placeholder;
        }
        else {
            NSAttributedString *attrPlaceholder = self.attributedPlaceholder;
            self.underlineWidthHelper.text = attrPlaceholder.string;
        }
    }
    
    CGSize size = [self.underlineWidthHelper sizeThatFits:CGSizeZero];
    return size.width;
}


@end
