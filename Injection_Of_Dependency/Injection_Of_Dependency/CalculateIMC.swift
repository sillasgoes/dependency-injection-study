//
//  CalculateIMC.swift
//  Injection_Of_Dependency
//
//  Created by Sillas Santos on 05/09/22.
//

import Foundation
import UIKit

protocol CalculateIMCDelegate: AnyObject {
    func calculateIMC(height: Double, weight: Double, _ completion: (String, UIColor) -> Void)
}

class CalculateIMC: CalculateIMCDelegate {
    
    func calculateIMC(height: Double, weight: Double, _ completion: (String, UIColor) -> Void){
        let result = weight / (height * height)
        
        switch result {
        case 0..<18.5:
            return completion("Abaixo do peso", .blue)
        case 18,5...24.9:
            return completion("Saudavel", .green)
        case 25...29.9:
            return completion("Acima do peso", .orange)
        case 30...:
            return completion("Obesidade", .red)
        default:
            return completion("", .black)
        }
    }
}
