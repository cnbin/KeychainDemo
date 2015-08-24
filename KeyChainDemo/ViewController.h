//
//  ViewController.h
//  KeyChainDemo
//
//  Created by Apple on 8/24/15.
//  Copyright (c) 2015 华讯网络投资有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Security/Security.h>
#define SystemThemeColor [UIColor colorWithRed:0 green:199.0f/255.0f blue:140.0f/255.0f alpha:1.0f]
@interface ViewController : UIViewController

@property(nonatomic,strong)UITextField * nameField;
@property(nonatomic,strong)UITextField * passwordField;

@property(nonatomic,strong)UIButton * addButton;
@property(nonatomic,strong)UIButton * checkButton;
@property(nonatomic,strong)UIButton * deleteButton;

@end

