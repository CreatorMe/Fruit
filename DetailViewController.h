//
//  DetailViewController.h
//  todo-table
//
//  Created by Student on 15-2-7.
//  Copyright (c) 2015年 neworigin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoDB.h"
@interface DetailViewController : UIViewController <UITextFieldDelegate>
{
    ToDo* detailTodo;
    
    ToDoDB* detailTododb;
    IBOutlet  UITextField* subjectText;
    IBOutlet UITextView* desprictionText;
    IBOutlet UITextField* priorityText;
    IBOutlet UITextField* dateText;
}
@property (nonatomic,retain) ToDoDB* detailTododb;
@property (nonatomic,retain) ToDo* detailTodo;

-(void)finish;
-(IBAction)keyBoard:(id)sender;
@end
