//
//  ViewController.h
//  Sudoku.v3
//
//  Created by Abigail Gregory on 2/10/13.
//  Copyright (c) 2013 Abigail Gregory, Izzy Funke, Ari Schlesinger, and Miranda Parker. All rights reserved.
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
    NSInteger currentTime;
    NSString *displayTime;
}

@property NSInteger currentTime;
@property NSTimer *secTimer;

-(void) buttonPressed;
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
-(void) updateTimer:(NSTimer *) theTimer;
-(void) loadNewGame;
-(void) viewDidAppear:(BOOL)animated;


@end
