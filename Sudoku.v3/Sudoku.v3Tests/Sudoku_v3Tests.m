//
//  Sudoku_v3Tests.m
//  Sudoku.v3Tests
//
//  Created by Abigail Gregory on 2/10/13.
//  Copyright (c) 2013 Abigail Gregory and Izzy Funke. All rights reserved.
//

#import "Sudoku_v3Tests.h"


@implementation Sudoku_v3Tests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    testGridModel = [[GridModel alloc] init];
    testGridGenerator = [[GridGenerator alloc] init];
    
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testGridModelGetValue
{
    // check that getValue does not take out of range rows and columns
    STAssertThrows([testGridModel getValue:9 :2], @"testGridModelGetValue out of range row");
    STAssertThrows([testGridModel getValue:2 :9], @"testGridModelGetValue out of range column");
}


- (void)testGridModelUpdateGrid
{
    // check that updateGrid does not take out of range rows, columns, or values
    STAssertThrows([testGridModel updateGrid:9 :2 :2], @"testGridModelUpdateGrid out of range row");
    STAssertThrows([testGridModel updateGrid:2 :9 :2], @"testGridModelUpdateGrid out of range column");
    STAssertThrows([testGridModel updateGrid:2 :2 :10], @"testGridModelUpdateGrid out of range for value");
}

- (void)testGridModelIsConsistent
{
    // check that isConsistent does not take out of range rows, columns, or values
    STAssertThrows([testGridModel isConsistent:9 :2 :2], @"testGridModelIsConsistent out of range row");
    STAssertThrows([testGridModel isConsistent:2 :9 :2], @"testGridModelIsConsistent out of range column");
    STAssertThrows([testGridModel isConsistent:2 :2 :10], @"testGridModelIsConsistent out of range for value");
}

- (void)testHasValue
{
    // make sure there is not an out of bounds row
    STAssertThrows([testGridModel hasValue:2 inRow:9], @"testHasValue out of range of row");
    
    // make sure there is not an out of bounds column
    STAssertThrows([testGridModel hasValue:2 inColumn:9], @"testHasValue out of range of column");
    
    // make sure we don't use an out of bounds block
    STAssertThrows([testGridModel hasValue:2 inBlock:10], @"testHasValue out of range for block");
}

- (void)testGridGeneratorGetValue
{
    // check that getValue does not take an out of bounds row or column
    STAssertThrows([testGridGenerator getValueAtRow:9 andColumn:2], @"testGetValue out of bounds for row");
    STAssertThrows([testGridGenerator getValueAtRow:2 andColumn:9], @"testGetValue out of bounds for column");
}

- (void)testGridModelInitializeGrid
{
    // check that updateGrid does not take out of range rows, columns, or values
    STAssertThrows([testGridModel initializeGrid:9 :2 :2], @"testGridModelInitializeGrid out of range row");
    STAssertThrows([testGridModel initializeGrid:2 :9 :2], @"testGridModelInitializeGrid out of range column");
    STAssertThrows([testGridModel initializeGrid:2 :2 :10], @"testGridModelUpdateGrid out of range for value");
}



@end
