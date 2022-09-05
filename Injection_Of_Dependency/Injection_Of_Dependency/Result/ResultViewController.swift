//
//  ResultViewController.swift
//  Injection_Of_Dependency
//
//  Created by Sillas Santos on 05/09/22.
//

import Foundation
import UIKit

class ResultViewController: UIViewController {
    
    var height: Double = 0.0
    var weight: Double = 0.0
    
    private var result = UILabel()
    
    let viewModel = ResultViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(result)
        viewModel.delegate = self
        setupView()
        addConstraints()
        configuredView()
    }
    
    func configuredView() {
        viewModel.getImc(height: height, weight: weight)
    }
    
    func setupView() {
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = .white
        result.textAlignment = .center
        result.font = UIFont.systemFont(ofSize: 40)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            result.topAnchor.constraint(equalTo: view.topAnchor, constant: (view.frame.height / 100) * 30),
            result.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.10),
            result.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: (view.frame.width / 100) * 10),
            result.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(view.frame.width / 100) * 10),
        ])
    }
}

extension ResultViewController: SetupViewDelegate {
    func setupView(result: ResultModel) {
        DispatchQueue.main.async { [ weak self ] in
            self?.result.text = result.resultImc
            self?.view.backgroundColor = result.backgroundColor
            self?.result.textColor = result.backgroundColor
        }
    }
}
