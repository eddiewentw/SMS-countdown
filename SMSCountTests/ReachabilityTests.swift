//
//  ReachabilityTests.swift
//  SMSCount
//
//  Created by Eddie on 2/4/16.
//  Copyright © 2016 Wen. All rights reserved.
//

import XCTest
@testable import SMSCount

class ReachabilityTests: XCTestCase {

    var reachability: Reachability?

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.

        self.reachability = Reachability()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
