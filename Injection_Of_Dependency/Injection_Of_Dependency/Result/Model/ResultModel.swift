//
//  ResultModel.swift
//  Injection_Of_Dependency
//
//  Created by Sillas Santos on 05/09/22.
//

import Foundation
import UIKit

struct ResultModel {
    
    var resultImc: String
    var backgroundColor: UIColor
    
    init(resultImc: String = "", backgroundColor: UIColor = .black) {
        self.resultImc = resultImc
        self.backgroundColor = backgroundColor
    }
}
