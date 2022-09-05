//
//  LoginViewController.swift
//  Injection_Of_Dependency
//
//  Created by Sillas Santos on 05/09/22.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    let email = UITextField()
    let password = UITextField()
    let buttonLogin = UIButton()
    let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        setupView()
        configureView()
        addConstraint()
    }
    
    func setupView(){
        view.addSubview(email)
        view.addSubview(password)
        view.addSubview(buttonLogin)
    }
    
    func configureView() {
        email.placeholder = "Email"
        email.backgroundColor = .white
        email.translatesAutoresizingMaskIntoConstraints = false
        email.borderStyle = .roundedRect
        
        password.placeholder = "Senha"
        password.backgroundColor = .white
        password.translatesAutoresizingMaskIntoConstraints = false
        
        var configuration = UIButton.Configuration.filled()
        configuration.cornerStyle = .medium
        configuration.background.cornerRadius = 15
        configuration.baseBackgroundColor = .white
        buttonLogin.configuration = configuration
        buttonLogin.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addConstraint(){
        let leading = view.frame.width * 100 / 2
        let trailing = -(view.frame.width * 100 / 2)
        
        NSLayoutConstraint.activate([
            
            email.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            email.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.70),
            email.topAnchor.constraint(equal: ((view.frame.height * 100) / 70))
            
            password.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            password.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.70),
            
            buttonLogin.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonLogin.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.50),
        ])
    }
}
