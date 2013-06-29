//
//  ViewController.h
//  crosswordcontextualsolver
//
//  Created by reuben on 15/6/13.
//  Copyright (c) 2013 space.works. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *patt;
@property (weak, nonatomic) IBOutlet UITextField *find;
//@property (copy, nonatomic) NSString *finds;
//@property (copy, nonatomic) NSString *patts;
//@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UIWebView *webView1;

- (IBAction)findhelp:(id)sender;

- (IBAction)enter:(id)sender;

- (IBAction)patthelp:(id)sender;

- (IBAction)pattenter:(id)sender;

@end
