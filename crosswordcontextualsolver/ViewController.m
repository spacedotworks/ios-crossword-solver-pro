//
//  ViewController.m
//  crosswordcontextualsolver
//
//  Created by reuben on 15/6/13.
//  Copyright (c) 2013 space.works. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
//@synthesize finds;
//@synthesize patts;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"test.jpg"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)findhelp:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Entering clues"
                                                    message:@"You may enter clues as they appear in the puzzle. For clues which have blanks, e.g. Helen of ____, you may use an underscore to represent the blank."
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
  //  [alert release];
}

- (IBAction)enter:(id)sender {
    
    NSURL *scriptUrl = [NSURL URLWithString:@"http://www.google.com"];
    NSData *data = [NSData dataWithContentsOfURL:scriptUrl];
    if (data){

    
    if([self.find.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops"
                                                        message:@"Please enter the clue."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    else if([self.patt.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops"
                                                        message:@"Please enter the pattern."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    else{

    NSString *urlStr = [NSString stringWithFormat:@"http://reubenli.net/cgi-bin/crosswordios.cgi?find=%@&patt=%@",
                          [self.find.text stringByReplacingOccurrencesOfString:@" " withString:@"+"],
                        [self.patt.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],
                        nil];
    NSURL *url = [NSURL URLWithString:urlStr];
    
    
        
        [self.view endEditing:YES];
    
   [_webView1 loadRequest:[NSURLRequest requestWithURL:url]];
       }
    }
    else { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops"
                                                           message:@"A working network connection is required."
                                                          delegate:nil
                                                 cancelButtonTitle:@"OK"
                                                 otherButtonTitles:nil];
        [alert show];}
}


- (IBAction)patthelp:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Entering patterns"
                                                    message:@"If none of the characters are known, the number of letters can be used (e.g. 5 or 6). If some of the letters are known, you can use a combination of numbers and symbols (. or ?) for the remaining unknowns. E.g. R?M?? or R1M2."
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];

}

- (IBAction)pattenter:(id)sender {
    
    NSURL *scriptUrl = [NSURL URLWithString:@"http://www.google.com"];
    NSData *data = [NSData dataWithContentsOfURL:scriptUrl];
    if (data){
          
    if([self.find.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops"
                                                        message:@"Please enter the clue."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    else if([self.patt.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops"
                                                        message:@"Please enter the pattern."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    else{

    
    NSString *urlStr = [NSString stringWithFormat:@"http://reubenli.net/cgi-bin/crosswordios.cgi?find=%@&patt=%@",
                        [self.find.text stringByReplacingOccurrencesOfString:@" " withString:@"+"],
                        [self.patt.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],
                        nil];
    NSURL *url = [NSURL URLWithString:urlStr];
  
    
    [_webView1 loadRequest:[NSURLRequest requestWithURL:url]];
    }
    }
    else { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops"
                                                           message:@"A working network connection is required."
                                                          delegate:nil
                                                 cancelButtonTitle:@"OK"
                                                 otherButtonTitles:nil];
        [alert show];}

}


- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.patt) {
        [theTextField resignFirstResponder];
    }
   
    return YES;
}

- (BOOL)textFieldShouldReturn2:(UITextField *)theTextField {
    if (theTextField == self.patt) {
        [theTextField resignFirstResponder];
    }

    return YES;
}



@end
