//
//  ResultViewModel.swift
//  Injection_Of_Dependency
//
//  Created by Sillas Santos on 05/09/22.
//

import Foundation
import UIKit

protocol setupViewDelegate: AnyObject {
    func setupView(result: ResultModel)
}

class ResulViewModel {
    
    let calculateImc: CalculateIMCDelegate?
    var text: String?
    var color: UIColor?
    
    weak var delegate: ResultViewController?
    
    init(calculateImc: CalculateIMCDelegate? = CalculateIMC()) {
        self.calculateImc = calculateImc
    }
    
    func receiverResultOfImc(text: String, color: UIColor) {
        self.text = text
        self.color = color
    }
    
    func getImc(height: Double, weight: Double){
        calculateImc?.calculateIMC(height: height, weight: weight, { text, color in
            delegate?.setupView(result: ResultModel(resultImc: text, backgroundColor: color))
        })
    }
}
