//
//  ViewController.m
//  TipCalculator
//
//  Created by Tyler Boudreau on 2018-04-20.
//  Copyright © 2018 Tyler Boudreau. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate,UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UITextField *tipPercentage;

@property (weak, nonatomic) IBOutlet UIButton *calculateTip;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;

@property (weak, nonatomic) IBOutlet UILabel *totalAmount;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _billAmountTextField.placeholder=@"Bill Total";
    _tipPercentage.placeholder=@"Tip percentage";
    
    
    self.billAmountTextField.keyboardType=UIKeyboardTypeNumberPad;
    self.tipPercentage.keyboardType=UIKeyboardTypeNumberPad;


}

-(void)displayBillAmount:(NSString *)billText;{
    self.billAmountTextField.text=billText;
    
}
-(void)displaytipPercentage:(NSString *)tipText;{
    self.tipPercentage.text=tipText;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dismissKeyboard:(id)sender{
    [self.billAmountTextField resignFirstResponder];
    [self.tipPercentage resignFirstResponder];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    [self displayBillAmount:@"$"];
    [self displaytipPercentage:@"%"];

    
    
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    [self displayBillAmount:textField.text];
    [self displaytipPercentage:textField.text];
    
    
    
}


-(BOOL)textFieldShouldClear:(UITextField *)textField{
    [self.billAmountTextField resignFirstResponder];
    [self.tipPercentage resignFirstResponder];
    return YES;
}

- (IBAction)tipCalculate:(id)sender {
    [self.billAmountTextField resignFirstResponder];
    [self.tipPercentage resignFirstResponder];

    self.tipAmountLabel.text = @([self.billAmountTextField.text floatValue] * [self.tipPercentage.text floatValue]*0.01).description;
    self.tipAmountLabel.text=[NSString stringWithFormat:@"%.2f",self.tipAmountLabel.text.floatValue];
    
    
    self.totalAmount.text=@(self.tipAmountLabel.text.floatValue + self.billAmountTextField.text.floatValue).description;
    
}
- (IBAction)adjustTipPercentage:(UISlider *)sender {
    self.tipPercentage.text = @(sender.value * 100).description;
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSCharacterSet *numberSet = [NSCharacterSet characterSetWithCharactersInString:@".1234567890"];
    NSCharacterSet *characterSet =[NSCharacterSet characterSetWithCharactersInString:string];
    
    BOOL stringIsValid =[numberSet isSupersetOfSet:characterSet];
    return stringIsValid;
}

@end
