//
//  ViewController.m
//  CurrencyConversion
//
//  Created by Billy Rey Caballero on 12/3/17.
//  Copyright © 2017 alcoderithm. All rights reserved.
//

#import "ViewController.h"
#import "CurrencyRequest/CRCurrencyRequest.h"
#import "CurrencyRequest/CRCurrencyResults.h"


@interface ViewController () <CRCurrencyRequestDelegate>

@property (nonatomic) CRCurrencyRequest *req;
@property (weak, nonatomic) IBOutlet UITextField *inputNumber;
@property (weak, nonatomic) IBOutlet UISegmentedControl *conversionChoices;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;
@property (weak, nonatomic) IBOutlet UILabel *inrValue;
@property (weak, nonatomic) IBOutlet UILabel *eurValue;
@property (weak, nonatomic) IBOutlet UILabel *mxnValue;

@end


@implementation ViewController

- (IBAction)convertCurrency:(id)sender {
    self.convertButton.enabled = NO;
    self.req = [[CRCurrencyRequest alloc] init];
    self.req.delegate = self;
    [self.req start];
}

- (void)currencyRequest:(CRCurrencyRequest *)req
    retrievedCurrencies:(CRCurrencyResults *)currencies {
    
    self.convertButton.enabled = YES;
    
    double inputValue = [self.inputNumber.text floatValue];
    
    double rupeeValue = inputValue * currencies.INR;
    double euroValue = inputValue * currencies.EUR;
    double pesoValue = inputValue * currencies.MXN;
    
    NSString *rupeeOutput = [NSString stringWithFormat:@"%0.2f", rupeeValue];
    NSString *euroOutput = [NSString stringWithFormat:@"%0.2f", euroValue];
    NSString *pesoOutput = [NSString stringWithFormat:@"%0.2f", pesoValue];
    
    if(self.conversionChoices.selectedSegmentIndex == 0){
        self.inrValue.text = rupeeOutput;
        self.eurValue.text = @"";
        self.mxnValue.text = @"";
    }
    else if(self.conversionChoices.selectedSegmentIndex == 1){
        self.inrValue.text = @"";
        self.eurValue.text = euroOutput;
        self.mxnValue.text = @"";
    }
    else {
        self.inrValue.text = @"";
        self.eurValue.text = @"";
        self.mxnValue.text = pesoOutput;
    }
}

@end
