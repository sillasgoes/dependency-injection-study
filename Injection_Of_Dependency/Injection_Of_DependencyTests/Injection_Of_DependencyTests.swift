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
    private var calculateIMC: CalculateIMCDelegate! = nil
    
    override func setUp() {
        super.setUp()
        calculateIMC = CalculateImcMock()
        sut = ResultViewModel(calculateImc: calculateIMC)
    }

    // MARK: - Tests
    
    func testGetImcWithSuccess() {
        // Given

        
        //When
        calculateIMC.calculateIMC(height: 0.0, weight: 0.0) { text, color in
            XCTAssertEqual("Saudavel", text)
            XCTAssertEqual(color, .green)
        }
        
        //Then
        sut.getImc(height: 1.90, weight: 87)
    }
}

class CalculateImcMock: CalculateIMCDelegate {
    
    var calculateIMCCompletionHandler: ((_ height: Double, _ weight: Double, _ completion: (String, UIColor) -> Void) -> Void)?
    
    func calculateIMC(height: Double, weight: Double, _ completion: (String, UIColor) -> Void) {
        calculateIMCCompletionHandler?(height, weight, completion)
    }
}
 
