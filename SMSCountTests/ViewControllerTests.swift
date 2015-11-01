//
//  ViewControllerTests.swift
//  SMSCount
//
//  Created by Eddie on 11/1/15.
//  Copyright © 2015 Wen. All rights reserved.
//

import XCTest
@testable import SMSCount

class ViewControllerTests: XCTestCase {

    var targetViewController: ViewController!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.targetViewController = storyboard.instantiateViewControllerWithIdentifier("ViewController") as! ViewController

        self.targetViewController.loadView()
        self.targetViewController.viewDidLoad()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testViewControllerExist() {
        XCTAssertNotNil( self.targetViewController, "ViewController is not existed." )
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}