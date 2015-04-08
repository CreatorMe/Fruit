//
//  DetailViewController.m
//  todo-table
//
//  Created by Student on 15-2-7.
//  Copyright (c) 2015年 neworigin. All rights reserved.
//
#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize detailTodo,detailTododb;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    subjectText.text=detailTodo.subject;
//    priorityText.text=[NSString stringWithFormat:@"%@",[NSNumber numberWithInt:detailTodo.priority]];
//    dateText.text=detailTodo.date;
//    desprictionText.text=detailTodo.todoDescription;
    self.navigationItem.title=@"详细事件";
    UIBarButtonItem* rightButton=[[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(finish)];
    self.navigationItem.rightBarButtonItem=rightButton;
    NSLog(@"%@",detailTodo);
    
    
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    subjectText.text=detailTodo.subject;
    priorityText.text=[NSString stringWithFormat:@"%@",[NSNumber numberWithInt:detailTodo.priority]];
    dateText.text=detailTodo.date;
    desprictionText.text=detailTodo.todoDescription;
     [super viewWillAppear:animated];
}

-(void)finish
{
    detailTodo.subject=subjectText.text;
    detailTodo.date=dateText.text;
    detailTodo.todoDescription=desprictionText.text;
    NSString* strp=[NSString stringWithString:priorityText.text];
    NSNumber* p=(NSNumber*)strp;
    detailTodo.priority=[p intValue];
    
    [detailTododb write];
  
    //detailTodo=nil;
}

-(IBAction)keyBoard:(id)sender
{
    [desprictionText resignFirstResponder];
    [priorityText resignFirstResponder];
    [subjectText resignFirstResponder];
    [dateText resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [desprictionText resignFirstResponder];
    [priorityText resignFirstResponder];
    [subjectText resignFirstResponder];
    [dateText resignFirstResponder];
    return YES;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (textField==priorityText) {
        self.view.frame=CGRectMake(0, -100, self.view.frame.size.width, self.view.frame.size.height);
    }
    if (textField==dateText) {
        self.view.frame=CGRectMake(0, -200, self.view.frame.size.width, self.view.frame.size.height);
    }
    return YES;
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    if (textField==priorityText) {
        self.view.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    }
    if (textField==dateText) {
        self.view.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    }
    return YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
