//
//  GridModel.m
//  Sudoku.v3
//
//  Created by Abigail Gregory on 2/10/13.
//  Copyright (c) 2013 Abigail Gregory, Izzy Funke, Ari Schlesinger, and Miranda Parker. All rights reserved.
//
#import "GridModel.h"
#include "GridView.h"


@implementation GridModel
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    return self;
}

-(bool) isConsistentInRow:(int)row inColumn:(int)column withValue:(int)num
{
    NSAssert(num <= 9 && num > 0, @"isConsistentInRow received num that is not 1-9");
    NSAssert(row < 9 && row >= 0, @"isConsistentInRow received row outside of range");
    NSAssert(column < 9 && column >= 0, @"isConsistentInRow received column outside of range");
    if (num == board[row][column])
        return true;
    
    return (![self hasValue: num inRow: row] && ![self hasValue: num inColumn: column] && ![self hasValue: num inBlock:[self blockNumForRow: row column: column]]);
}

-(void) updateGridAtRow:(int)row atColumn:(int)column withValue:(int)num
{
    NSAssert(num <= 10 && num >= 0, @"updateGridAtRow received num that is not 1-9");
    NSAssert(row < 9 && row >= 0, @"updateGridAtRow received row outside of range");
    NSAssert(column < 9 && column >= 0, @"updateGridAtRow received column outside of range");
    board[row][column]=num;
}


-(int)getValueAtRow:(int)row atColumn:(int)column
{
    NSAssert(row < 9 && row >= 0, @"getValue received row outside of range");
    NSAssert(column < 9 && column >= 0, @"getValue received column outside of range");
    return board[row][column];
}


-(bool) isMutableAtRow:(int)row atColumn:(int)column
{
    return (initBoard[row][column]==0);
}


-(bool) hasValue: (int) value inRow: (int) row
{
    NSAssert(row < 9 && row >= 0, @"hasValueinRow received row outside of range");
    for (int column = 0; column<9; column++) {
        if (board[row][column]==value)
            return true;
    }
    return false;
}

-(bool) hasValue: (int) value inColumn: (int) column
{
    NSAssert(column < 9 && column >= 0, @"hasValueinColumn received column outside of range");
    for (int row = 0; row<9; row++) {
        if (board[row][column]==value)
            return true;
    }
    return false;
}


-(int) blockNumForRow: (int) row column: (int) column
{
    return (row/3)*3 + (column/3);
}

-(bool) hasValue: (int) value inBlock:(int) block
{
    NSAssert(block < 9 && block >= 0, @"hasValueinBlock received block outside of range");
    int rowStart = (block/3)*3;
    int columnStart = (block%3)*3;
    for (int i=rowStart; i<rowStart+3; i++){
        for (int j=columnStart; j<columnStart+3; j++){
            if(board[i][j]==value){
                return true;
            }
        }
    }
    return false;
}

-(void)initializeGridAtRow:(int)row AtColumn:(int)column withValue:(int)value
{
    NSAssert(value <= 9 && value >= 0, @"initializeGrid received num that is not 1-9");
    NSAssert(row < 9 && row >= 0, @"initializeGrid received row outside of range");
    NSAssert(column < 9 && column >= 0, @"initializeGrid received column outside of range");
    
    initBoard[row][column] = value;
}

-(bool) isFull
{
    for (int row = 0; row < 9; row++) {
        for (int col = 0; col < 9; col++) {
            if (board[row][col] == 0)
                return false;
        }
    }
    return true;
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end