//
//  GridGenerator.h
//  Sudoku.v3
//
//  Created by Abigail Gregory on 2/10/13.
//  Copyright (c) 2013 Abigail Gregory, Izzy Funke, Ari Schlesinger, and Miranda Parker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GridGenerator : NSObject
{
    int initialGrid[9][9];
}

-(void) readGridFromFile;
-(int) getValueAtRow: (int) row andColumn: (int) column;

@end
