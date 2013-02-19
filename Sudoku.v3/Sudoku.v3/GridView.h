//
//  GridView.h
//  Sudoku.v3
//
//  Created by Abigail Gregory on 2/10/13.
//  Copyright (c) 2013 Abigail Gregory, Izzy Funke, Ari Schlesinger, and Miranda Parker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GridView : UIView{
    NSMutableArray* buttonArray;
    id target;
    SEL selector;
}

@property int currentRow;
@property int currentColumn;

-(void) buttonPressed: (id) sender;
-(void) setValueAtRow: (int) row column: (int) column value: (int) value color: (UIColor*) color;
-(void) setTarget: (id) target action: (SEL) action;
@end

