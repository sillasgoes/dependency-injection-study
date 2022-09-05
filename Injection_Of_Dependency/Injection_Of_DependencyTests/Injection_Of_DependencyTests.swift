//
//  Injection_Of_DependencyTests.swift
//  Injection_Of_DependencyTests
//
//  Created by Sillas Santos on 05/09/22.
//

import XCTest
@testable import Injection_Of_Dependency

class Injection_Of_DependencyTests: XCTestCase {
    
    private var sut: ResultViewModel! = nil
    private var calculateIMC: CalculateImcMock! = nil
    
    override func setUp() {
        super.setUp()
        calculateIMC = CalculateImcMock()
        sut = ResultViewModel(calculateImc: calculateIMC)
    }

    // MARK: - Tests
    
    func testGetImcWithSuccess() {
        // Given
        let expectationSuccess = expectation(description: "Call method with success")
        
        //When
        calculateIMC.calculateIMCCompletionHandler = { height, weight, completion in
            XCTAssertEqual(height, 1.90)
            XCTAssertEqual(weight, 87)
            expectationSuccess.fulfill()
        }
        
        //Then
        sut.getImc(height: 1.90, weight: 87)
        waitForExpectations(timeout: 2.0)
    }
}

class CalculateImcMock: CalculateIMCDelegate {
    
    public var calculateIMCCompletionHandler: ((_ height: Double, _ weight: Double, _ completion: (String, UIColor) -> Void) -> Void)?
    
    func calculateIMC(height: Double, weight: Double, _ completion: (String, UIColor) -> Void) {
        calculateIMCCompletionHandler?(height, weight, completion)
    }
}
 
