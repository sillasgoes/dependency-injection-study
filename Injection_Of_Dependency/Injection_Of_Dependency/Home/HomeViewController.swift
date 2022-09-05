//
//  ViewController.swift
//  Injection_Of_Dependency
//
//  Created by Sillas Santos on 05/09/22.
//

import UIKit

protocol homeViewControllerDataDelegate: AnyObject {
    func sendData(height: Double, weight: Double)
}

class HomeViewController: UIViewController {
    
    let height = UITextField()
    let weight = UITextField()
    let button = UIButton()
    
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        setupView()
        configuredView()
        addConstraint()
    }
    
    func setupView() {
        view.addSubview(height)
        view.addSubview(weight)
        view.addSubview(button)
    }
    
    func addConstraint() {
        NSLayoutConstraint.activate([
            height.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: (view.frame.height / 100) * 20),
            height.heightAnchor.constraint(equalToConstant: (view.frame.height / 100) * 7),
            height.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: (view.frame.width / 100) * 10),
            height.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(view.frame.width / 100) * 10),

            weight.topAnchor.constraint(equalTo: height.bottomAnchor, constant: (view.frame.height / 100) * 2),
            weight.heightAnchor.constraint(equalToConstant: (view.frame.height / 100) * 7),
            weight.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: (view.frame.width / 100) * 10),
            weight.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(view.frame.width / 100) * 10),

            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: weight.bottomAnchor, constant: (view.frame.height / 100) * 5),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: (view.frame.width / 100) * 20),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(view.frame.width / 100) * 20),
        ])
    }
    
    func configuredView() {
        height.placeholder = "Altura"
        height.backgroundColor = .white
        height.textColor = .black
        height.textAlignment = .center
        height.layer.cornerRadius = 5
        
        height.translatesAutoresizingMaskIntoConstraints = false
        
        weight.placeholder = "Peso"
        weight.backgroundColor = .white
        weight.textColor = .black
        weight.textAlignment = .center
        weight.layer.cornerRadius = 5

        weight.translatesAutoresizingMaskIntoConstraints = false
        
        var configuration = UIButton.Configuration.filled()
        configuration.cornerStyle = .medium
        configuration.background.cornerRadius = 15
        configuration.baseBackgroundColor = .black
        configuration.buttonSize = .large
        configuration.attributedTitle = "Calcular"
        
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didButtonPressed), for: .touchUpInside)
    }
    
    @objc func didButtonPressed() {
        guard let height = height.text, let weight = weight.text else { return }
        let vc = ResultViewController()
        vc.height = Double(height) ?? 0.0
        vc.weight = Double(weight) ?? 0.0
        navigationController?.pushViewController(vc, animated: true)
    }
}
