//
//  GridModel.h
//  Sudoku.v3
//
//  Created by Abigail Gregory on 2/10/13.
//  Copyright (c) 2013 Abigail Gregory, Izzy Funke, Ari Schlesinger, and Miranda Parker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GridModel : UIView
{
    int board[9][9];
    int initBoard[9][9];
}
-(bool) isConsistentInRow: (int) row inColumn: (int) column withValue: (int) num;
-(void) updateGridAtRow: (int) row atColumn: (int) column withValue: (int) num;
-(int)  getValueAtRow: (int) row atColumn: (int) column;
-(bool) isMutableAtRow: (int) row atColumn: (int) column;
-(bool) hasValue: (int) value inRow: (int) row;
-(bool) hasValue: (int) value inColumn: (int) column;
-(int)  blockNumForRow: (int) row column: (int) column;
-(bool) hasValue: (int) value inBlock:(int) block;
-(void) initializeGridAtRow: (int) row AtColumn: (int) column withValue: (int) value;
-(bool) isFull;



@end