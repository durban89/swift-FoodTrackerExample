//
//  FoodTrackerExampleTests.swift
//  FoodTrackerExampleTests
//
//  Created by durban.zhang on 2017/5/18.
//  Copyright © 2017年 durban.zhang. All rights reserved.
//

import XCTest
@testable import FoodTrackerExample

class FoodTrackerExampleTests: XCTestCase {
    // MARK: MealModel Class Tests
    
    // Confirm that the Meal initializer returns a Meal object when passed valid parameters.
    func testMealModelInitializationSucceeds(){
        // Zero rating
        let zeroRatingMeal = MealModel.init(name: "Zero", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRatingMeal)
        
        // Highest positive rating
        let positiveRatingMeal = MealModel.init(name: "Positive", photo: nil, rating: 5)
        XCTAssertNotNil(positiveRatingMeal)
        
    }
    
    func testMealModelInitializationFails(){
        // Rating exceeds maximum
        let largeRatingMeal = MealModel.init(name: "Large", photo: nil, rating: 6)
        XCTAssertNil(largeRatingMeal)
    }
    
//    override func setUp() {
//        super.setUp()
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//    
//    override func tearDown() {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//        super.tearDown()
//    }
//    
//    func testExample() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
}
