//
//  Sudoku_v3Tests.h
//  Sudoku.v3Tests
//
//  Created by Abigail Gregory on 2/10/13.
//  Copyright (c) 2013 Abigail Gregory and Izzy Funke. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "GridModel.h"
#import "GridGenerator.h"

@interface Sudoku_v3Tests : SenTestCase
{
    GridGenerator* testGridGenerator;
    GridModel* testGridModel;
}

- (void)testGridModelGetValue;
- (void)testGridModelUpdateGrid;
- (void)testGridModelIsConsistent;
- (void)testHasValue;
- (void)testGridGeneratorGetValue;
- (void)testGridModelInitializeGrid;



@end
