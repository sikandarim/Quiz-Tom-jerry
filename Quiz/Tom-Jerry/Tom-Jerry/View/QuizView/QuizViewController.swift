//
//  ViewController.swift
//  Tom-Jerry
//

import UIKit

class QuizViewController: UIViewController {
   
    let headerVC = Header()
    let bodySection =  BodySection()
    let footerSection = Footer()
  
  
   
    lazy var stackView = UIStackView(arrangedSubviews: [headerVC, bodySection,footerSection])
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    
        
    }

}

extension QuizViewController {
    
    private func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
    }
    
    private func layout() {
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            headerVC.heightAnchor.constraint(equalToConstant: 100),
            headerVC.widthAnchor.constraint(equalToConstant: 200),
            bodySection.heightAnchor.constraint(equalToConstant: 570),
            bodySection.widthAnchor.constraint(equalToConstant: 200),
            footerSection.heightAnchor.constraint(equalToConstant: 50),
            footerSection.widthAnchor.constraint(equalToConstant: 200),
            footerSection.bottomAnchor.constraint(equalTo: stackView.bottomAnchor)
          
        ])
    }
    
}

