//
//  ViewController.m
//  Sudoku.v3
//
//  Created by Abigail Gregory on 2/10/13.
//  Copyright (c) 2013 Abigail Gregory and Izzy Funke. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // Read the grid in from file.
    theGridGenerator = [[GridGenerator alloc] init];
    [theGridGenerator readGridFromFile];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
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

-(void) buttonPressed
{
    int row = theGrid.currentRow;
    int column = theGrid.currentColumn;
    int value = theNumPad.currentValue;
    if ([theGridModel isMutableAtRow:row column:column]){
        if([theGridModel isConsistent:row :column :value]){
            [theGrid setValueAtRow:row column:column value:value color:[UIColor blueColor]];
            [theGridModel updateGrid:row :column :value];
        }
    }
    
    
    NSLog(@"got button");
    
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end

