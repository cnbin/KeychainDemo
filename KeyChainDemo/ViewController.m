//
//  ViewController.m
//  KeyChainDemo
//
//  Created by Apple on 8/24/15.
//  Copyright (c) 2015 华讯网络投资有限公司. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
   _nameField=[[UITextField alloc]initWithFrame:CGRectMake(20,50, 280, 30)];
   _nameField.placeholder=@"请输入手机号";
   _nameField.keyboardType = UIKeyboardTypeNumberPad;
   _nameField.returnKeyType=UIReturnKeyDone;
   _nameField.clearButtonMode = UITextFieldViewModeWhileEditing;
   [_nameField.layer setBorderWidth:1.0];
   [_nameField.layer setCornerRadius:8.0];
    [self.view addSubview:_nameField];

   _passwordField=[[UITextField alloc]initWithFrame:CGRectMake(20,100,235, 30)];
   _passwordField.placeholder=@" 请输入动态密码";
   _passwordField.textAlignment =NSTextAlignmentLeft;
   _passwordField.returnKeyType=UIReturnKeyDone;
   _passwordField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [_passwordField.layer setBorderWidth:1.0];
    [_passwordField.layer setCornerRadius:8.0];
    [self.view addSubview:_passwordField];

    
    _addButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 150, 60, 30)];
    _checkButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 200, 60, 30)];
    _deleteButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 250, 60, 30)];
    
    
    [_addButton setTitle:@"添加" forState:UIControlStateNormal];
    [_addButton setBackgroundColor:SystemThemeColor];
    [_addButton.layer setBorderWidth:1.0];
    [_addButton.layer setMasksToBounds:YES];
    [_addButton.layer setCornerRadius:10.0];
    
    [_checkButton setTitle:@"查询" forState:UIControlStateNormal];
    [_checkButton setBackgroundColor:SystemThemeColor];
    [_checkButton.layer setBorderWidth:1.0];
    [_checkButton.layer setMasksToBounds:YES];
    [_checkButton.layer setCornerRadius:10.0];
    
    [_deleteButton setTitle:@"删除" forState:UIControlStateNormal];
    [_deleteButton setBackgroundColor:SystemThemeColor];
    [_deleteButton.layer setBorderWidth:1.0];
    [_deleteButton.layer setMasksToBounds:YES];
    [_deleteButton.layer setCornerRadius:10.0];
    

    [_addButton addTarget:self action:@selector(addbuttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_checkButton addTarget:self action:@selector(checkbuttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_deleteButton addTarget:self action:@selector(deletebuttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_addButton];
    [self.view addSubview:_checkButton];
    [self.view addSubview:_deleteButton];
}

-(void)addbuttonAction:(UIButton *)button {

    NSMutableDictionary* dic = [NSMutableDictionary dictionary];
    [dic setObject:(__bridge id)(kSecClassGenericPassword) forKey:(__bridge id)(kSecClass)];
   
    [dic setObject:[_passwordField.text dataUsingEncoding:NSUTF8StringEncoding] forKey:(__bridge id<NSCopying>)(kSecValueData)];
    
    OSStatus s = SecItemAdd((__bridge CFDictionaryRef)dic, NULL);
   
    NSLog(@"add-status is %d",(int)s);
}

-(void)checkbuttonAction:(UIButton *)button {
    NSDictionary* query = [NSDictionary dictionaryWithObjectsAndKeys:(__bridge id)(kSecClassGenericPassword),kSecClass,
                           kSecMatchLimitAll,kSecMatchLimit,
                           kCFBooleanTrue,kSecReturnAttributes,nil];
    CFTypeRef result = nil;
    OSStatus s = SecItemCopyMatching((__bridge CFDictionaryRef)query, &result);
    
    NSLog(@"s-check is%d",(int)s);
    NSLog(@"result is %@",result);
}

-(void)deletebuttonAction:(UIButton *)button {
 
        NSDictionary* query = [NSDictionary dictionaryWithObjectsAndKeys:(__bridge id)(kSecClassGenericPassword),kSecClass,
                               _nameField.text,kSecAttrAccount,nil];
        OSStatus status = SecItemDelete((__bridge CFDictionaryRef)query);
        NSLog(@"status is %d",(int)status);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
