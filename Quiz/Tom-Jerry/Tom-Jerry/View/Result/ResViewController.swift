//
//  ResViewController.swift
//  Tom-Jerry
//
//  Created by Mariam Sikandari on 2023-06-30.
//

import UIKit

class ResViewController: UIViewController, QuestionsViewDelegate {
   
  
    let headerVC = Header()
    
    let questionLabel = UILabel()
    let scoreLabel = UILabel()
    let restartBtn = UIButton(type: .system)

 
    
    lazy var stackView = UIStackView(arrangedSubviews: [headerVC, questionLabel,scoreLabel,restartBtn])
    private var quizVm = QuizVM()
    private var body = BodySection()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        body.delegate = self
    
    }

    func quizScore(score: String) {
        scoreLabel.text = score
    }
    

}
extension ResViewController {
    
    private func style() {
        
       
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.text = "Your Score:"
        questionLabel.textAlignment = .center
        questionLabel.textColor = .black
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
      //  scoreLabel.text = score1
        scoreLabel.textAlignment = .center
        scoreLabel.textColor = .black
        restartBtn.translatesAutoresizingMaskIntoConstraints = false
        restartBtn .configuration = .borderedTinted()
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
            questionLabel.heightAnchor.constraint(equalToConstant: 50),
            questionLabel.widthAnchor.constraint(equalToConstant: 200),
            scoreLabel.heightAnchor.constraint(equalToConstant: 50),
            scoreLabel.widthAnchor.constraint(equalToConstant: 200),
            restartBtn.heightAnchor.constraint(equalToConstant: 50),
            restartBtn.widthAnchor.constraint(equalToConstant: 200),
        ])
  
    }
    
}

