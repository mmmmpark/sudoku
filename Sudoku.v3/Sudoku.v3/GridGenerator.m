//
//  GridGenerator.m
//  Sudoku.v3
//
//  Created by Abigail Gregory on 2/10/13.
//  Copyright (c) 2013 Abigail Gregory, Izzy Funke, Ari Schlesinger, and Miranda Parker. All rights reserved.
//

#import "GridGenerator.h"

@implementation GridGenerator
-(void) readGridFromFile
{
    NSString* path = [[NSBundle mainBundle] pathForResource: @"grid2" ofType: @"txt"];
    NSError* error;
    
    NSString* readString = [[NSString alloc] initWithContentsOfFile:path encoding: NSUTF8StringEncoding error:&error];
    
    int gridChoice = arc4random()%30000 * 82;
    
    for (int row = 0; row < 9; row++)
    {
        for (int col = 0; col < 9; col++)
        {
            // We wanted to do the following, but we couldn't figure out Objective C :(
            //if (strcmp([readString characterAtIndex:row*9+col], ".") == 0)
            //    initialGrid[row][col] = 0;
            
            initialGrid[row][col] = (int) [readString characterAtIndex:gridChoice+row*9+col] - '0';
            if (initialGrid[row][col] < 0)
                initialGrid[row][col] = 0;
        }
    }

}

-(int) getValueAtRow: (int) row atColumn: (int) column
{
    NSAssert(row < 9 && row >= 0, @"getValueAtRow received row that is out of bounds");
    NSAssert(column < 9 && column >= 0, @"getValueAtRow received column that is out of bounds");
    return initialGrid[row][column];
}

@end

