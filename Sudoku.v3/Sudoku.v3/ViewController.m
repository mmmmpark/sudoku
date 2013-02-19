//
//  ViewController.m
//  Sudoku.v3
//
//  Created by Abigail Gregory on 2/10/13.
//  Copyright (c) 2013 Abigail Gregory, Izzy Funke, Ari Schlesinger, and Miranda Parker. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController

@synthesize currentTime;
@synthesize secTimer;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // Read the grid in from file.
    theGridGenerator = [[GridGenerator alloc] init];
    [theGridGenerator readGridFromFile];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    //create the grid model
    theGridModel =[[GridModel alloc] init];
    
    //create the frame for number pad
    int numPadX = self.view.bounds.size.width *.10;
    int numPadY = self.view.bounds.size.height *.8;
    int numPadWidth = MIN(self.view.bounds.size.width, self.view.bounds.size.height) *.8;
    int numPadHeight = MIN(self.view.bounds.size.width, self.view.bounds.size.height) *.1;
    CGRect numPadFrame = CGRectMake(numPadX, numPadY, numPadWidth, numPadHeight);
    
    //create the number pad grid
    theNumPad  = [[NumberPadView alloc] initWithFrame:numPadFrame];
    [self.view addSubview: theNumPad];
    
    
    //create the frame for grid
    int originX = self.view.bounds.size.width *.10;
    int originY = self.view.bounds.size.height *.10;
    int size = MIN(self.view.bounds.size.width, self.view.bounds.size.height) *.8;
    CGRect gridFrame = CGRectMake(originX, originY, size, size);

    //update the model with values from the generator
    for (int row = 0; row<9; row++){
        for (int column=0; column<9; column++)
        {
            int value = [theGridGenerator getValueAtRow:row atColumn:column];
            [theGridModel initializeGridAtRow:row AtColumn:column withValue:value];
            [theGridModel updateGridAtRow:row atColumn:column withValue:value];
        }
    }
    
    //create the grid
    theGrid = [[GridView alloc] initWithFrame:gridFrame];
    [self.view addSubview: theGrid];
    [theGrid setTarget: self action: @selector(buttonPressed)];
    for (int row = 0; row<9; row++){
        for (int column=0; column<9; column++){
            int value = [theGridModel getValueAtRow:row atColumn:column];
            if (value>0)
                [theGrid setValueAtRow: row atColumn: column withValue: value withColor: [UIColor blackColor]];
        }
    }
    
    //create the New Game button
    int gameOriginX = self.view.bounds.size.width *.75;
    int gameOriginY = self.view.bounds.size.height *.05;
    int size1 = gameOriginY*0.75;
    int size2 = size1*3;
    CGRect newGameFrame = CGRectMake(gameOriginX, gameOriginY, size2, size1);
    
    //create the New Game button on grid
    UIButton* newGame = [[UIButton alloc] initWithFrame:newGameFrame];
    [newGame addTarget:self action:@selector(newGamePressed) forControlEvents:UIControlEventTouchUpInside];
    [newGame setTitle:[NSString stringWithFormat:@"New Game"] forState:UIControlStateNormal];
    
    [newGame setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    newGame.backgroundColor = [UIColor blackColor];
    [self.view addSubview:newGame];
}

-(void) newGamePressed
{
    NSLog(@"New Game Pressed");
    [self loadNewGame];
    currentTime = -1;
}

-(void) buttonPressed
{
    int row = theGrid.currentRow;
    int column = theGrid.currentColumn;
    int value = theNumPad.currentValue;
    
    if ([theGridModel isMutableAtRow:row atColumn:column]){
        if (value == 10)
        {
            [theGrid setValueAtRow:row atColumn:column withValue:0 withColor:[UIColor blueColor]];
            [theGridModel updateGridAtRow:row atColumn:column withValue:0];
        }
        else if ([theGridModel isConsistentInRow: row inColumn: column withValue: value])
        {
            [theGrid setValueAtRow:row atColumn:column withValue:value withColor:[UIColor blueColor]];
            [theGridModel updateGridAtRow:row atColumn:column withValue:value];
            if ([theGridModel isFull])
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You won!"
                    message:[NSString stringWithFormat:@"Time: %@",displayTime]
                    delegate:self
                    cancelButtonTitle:@"Play again?"
                    otherButtonTitles:@"Exit", nil];
                [alert show];                
            }
        }
    }
    
    
    NSLog(@"got button");
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [secTimer invalidate];
    if (buttonIndex == 0){
        [self loadNewGame];
    }
    else if (buttonIndex == 1){        
        // exit the game
        exit(0);
    }
}

-(void) updateTimer:(NSTimer *) theTimer
{
    NSInteger mins,secs;
    currentTime++;
    mins=currentTime/60;
    secs=currentTime%60;
    displayTime = [NSString stringWithFormat:@"%02d:%02d",mins,secs];
    
    int originX = self.view.bounds.size.width *.10;
    int originY = self.view.bounds.size.height *.05;
    int size1 = originY*0.75;
    int size2 = size1*2;
    
    UIButton *theButton = [[UIButton alloc] initWithFrame: CGRectMake(originX, originY, size2, size1)];
    [theButton setBackgroundColor:[UIColor blackColor]];
    [theButton setTitle:[[NSString alloc] initWithFormat:@"%@", displayTime] forState:UIControlStateNormal];
    [self.view addSubview:theButton];
}

-(void) loadNewGame
{
    [theGridGenerator readGridFromFile];
    
    //create the frame for grid
    int originX = self.view.bounds.size.width *.10;
    int originY = self.view.bounds.size.height *.10;
    int size = MIN(self.view.bounds.size.width, self.view.bounds.size.height) *.8;
    CGRect gridFrame = CGRectMake(originX, originY, size, size);
    
    //update the model with values from the generator
    for (int row = 0; row<9; row++){
        for (int column=0; column<9; column++)
        {
            int value = [theGridGenerator getValueAtRow:row andColumn:column];
            [theGridModel initializeGrid:row :column: value];
            [theGridModel updateGrid:row :column :value];
        }
    }
    
    //create the grid
    theGrid = [[GridView alloc] initWithFrame:gridFrame];
    [self.view addSubview: theGrid];
    [theGrid setTarget: self action: @selector(buttonPressed)];
    for (int row = 0; row<9; row++){
        for (int column=0; column<9; column++){
            int value = [theGridModel getValue: row :column];
            if (value>0)
                [theGrid setValueAtRow: row column: column value: value color: [UIColor blackColor]];
        }
    }
}

-(void) viewDidAppear:(BOOL)animated
{
    currentTime = -1;
    self.secTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimer:) userInfo:nil repeats:YES];
    [secTimer fire];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

