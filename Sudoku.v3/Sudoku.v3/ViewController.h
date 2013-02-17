//
//  ViewController.h
//  Sudoku.v3
//
//  Created by Abigail Gregory on 2/10/13.
//  Copyright (c) 2013 Abigail Gregory and Izzy Funke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GridView.h"
#import "NumberPadView.h"
#import "GridModel.h"
#import "GridGenerator.h"

@interface ViewController : UIViewController<UIAlertViewDelegate>{
    GridView* theGrid;
    NumberPadView* theNumPad;
    GridModel* theGridModel;
    GridGenerator* theGridGenerator;
}

-(void) buttonPressed;
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;

@end
