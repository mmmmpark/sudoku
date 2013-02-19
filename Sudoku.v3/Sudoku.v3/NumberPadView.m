//
//  NumberPadView.m
//  Sudoku.v3
//
//  Created by Abigail Gregory on 2/10/13.
//  Copyright (c) 2013 Abigail Gregory, Izzy Funke, Ari Schlesinger, and Miranda Parker. All rights reserved.
//

#import "NumberPadView.h"

@implementation NumberPadView
@synthesize currentValue;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor=[UIColor blackColor];
        int size = (self.bounds.size.width-(20+5*9)) *(1/10.0);
        int originX=10;
        int originY=(self.bounds.size.height-size)/2;
        numberPad = [[NSMutableArray alloc] init];
        for(int i = 0; i<10; i++){
            
            [numberPad addObject:[[UIButton alloc] initWithFrame:CGRectMake(originX, originY, size, size)]];
            
            [((UIButton*)[numberPad objectAtIndex:i]) addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
            if (i < 9)
            {
                [((UIButton*)[numberPad objectAtIndex:i]) setTitle:[NSString stringWithFormat:@"%d", (i+1)] forState:UIControlStateNormal];
            }
            else
            {
                [((UIButton*)[numberPad objectAtIndex:i]) setTitle:[NSString stringWithFormat:@"Erase"] forState:UIControlStateNormal];
            }
            
            [((UIButton*)[numberPad objectAtIndex:i]) setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            [((UIButton*)[numberPad objectAtIndex:i]) setTag:i+1];
            
            //set background color of numpad buttons
            if (i==0){
                
                ((UIButton*)[numberPad objectAtIndex:i]).backgroundColor=[UIColor yellowColor];
            }
            else{
                
                ((UIButton*)[numberPad objectAtIndex:i]).backgroundColor=[UIColor whiteColor];
            }
            [self addSubview:(UIButton*)[numberPad objectAtIndex:i]];
            
            
            originX+=6+size;
            currentValue = 1;
        }
        
        
    }
    return self;
}

// buttonPressed method to tell the ViewController what the NumPad's currentValue is
-(void) buttonPressed: (id) sender{
    [sender setBackgroundColor:[UIColor yellowColor]];
    
    if (((UIButton*) sender).tag != currentValue) {
        UIButton* theButton = [numberPad objectAtIndex: currentValue-1];
        [theButton setBackgroundColor: [UIColor whiteColor]];
    }
    
    currentValue= ((UIButton*) sender).tag;
}


@end