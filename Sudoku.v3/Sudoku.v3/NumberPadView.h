//
//  NumberPadView.h
//  Sudoku.v3
//
//  Created by Abigail Gregory on 2/10/13.
//  Copyright (c) 2013 Abigail Gregory, Izzy Funke, Ari Schlesinger, and Miranda Parker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NumberPadView : UIView
{
    NSMutableArray* numberPad;
}

@property int currentValue;

-(void) buttonPressed: (id) sender;


@end
