//
//  CalculatorAppTests.swift
//  CalculatorAppTests
//
//  Created by Mohammad Azam on 12/18/18.
//  Copyright © 2018 Mohammad Azam. All rights reserved.
//

import XCTest
@testable import CalculatorApp

class CalculatorAppTests: XCTestCase {

    func test_SubtractTwoNumbers() {
        
        let calculator = Calculator()
        let result = calculator.subtract(5,2)
        XCTAssertEqual(result, 3)
        
    }
    
    func test_AddTwoNumbers() {
       
        let calculator = Calculator()
        let result = calculator.add(2,3)
        
        XCTAssertEqual(result, 5)
        
    }
    

}
