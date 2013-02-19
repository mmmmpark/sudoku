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
    STAssertThrows([testGridModel getValueAtRow:9 atColumn:2], @"testGridModelGetValue out of range row");
    STAssertThrows([testGridModel getValueAtRow:2 atColumn:9], @"testGridModelGetValue out of range column");
}


- (void)testGridModelUpdateGrid
{
    // check that updateGrid does not take out of range rows, columns, or values
    STAssertThrows([testGridModel updateGridAtRow:9 atColumn:2 withValue:2], @"testGridModelUpdateGrid out of range row");
    STAssertThrows([testGridModel updateGridAtRow:2 atColumn:9 withValue:2], @"testGridModelUpdateGrid out of range column");
    STAssertThrows([testGridModel updateGridAtRow:2 atColumn:2 withValue:10], @"testGridModelUpdateGrid out of range for value");
}

- (void)testGridModelIsConsistent
{
    // check that isConsistent does not take out of range rows, columns, or values
    STAssertThrows([testGridModel isConsistentInRow:9 inColumn:2 withValue:2], @"testGridModelIsConsistent out of range row");
    STAssertThrows([testGridModel isConsistentInRow:2 inColumn:9 withValue:2], @"testGridModelIsConsistent out of range column");
    STAssertThrows([testGridModel isConsistentInRow:2 inColumn:2 withValue:10], @"testGridModelIsConsistent out of range for value");
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
    STAssertThrows([testGridGenerator getValueAtRow:9 atColumn:2], @"testGetValue out of bounds for row");
    STAssertThrows([testGridGenerator getValueAtRow:2 atColumn:9], @"testGetValue out of bounds for column");
}

- (void)testGridModelInitializeGrid
{
    // check that updateGrid does not take out of range rows, columns, or values
    STAssertThrows([testGridModel initializeGridAtRow:9 AtColumn:2 withValue:2], @"testGridModelInitializeGrid out of range row");
    STAssertThrows([testGridModel initializeGridAtRow:2 AtColumn:9 withValue:2], @"testGridModelInitializeGrid out of range column");
    STAssertThrows([testGridModel initializeGridAtRow:2 AtColumn:2 withValue:10], @"testGridModelUpdateGrid out of range for value");
}



@end
