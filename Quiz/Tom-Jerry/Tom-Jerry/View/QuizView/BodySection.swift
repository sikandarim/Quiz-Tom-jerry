//
//  BodySection.swift
//  Tom-Jerry
//
//  Created by Mariam Sikandari on 2023-06-30.
//

import Foundation
import UIKit

protocol QuestionsViewDelegate: AnyObject {
    func quizScore(score: String)
 
    
}

protocol didFinishDelegate: AnyObject {
    func didFinish()
    
}


class BodySection: UIView {
   
    let questionLabel = UILabel()
    let imageheader = UIImageView(image: UIImage(named: "tom-food"))
    
    weak var delegate: QuestionsViewDelegate?
    weak var delegate1: didFinishDelegate?
    var userScore = ""
   
  
    
    private lazy var choice1: UIButton = {
        let button = createButton()
        button.addTarget(self, action: #selector(answerButtonPressed), for: .primaryActionTriggered)
         return button
     }()
     private lazy var choice2: UIButton = {
        let button = createButton()
         button.addTarget(self, action: #selector(answerButtonPressed), for: .primaryActionTriggered)
         return button
     }()
     
     private lazy var choice3: UIButton = {
        let button = createButton()
         button.addTarget(self, action: #selector(answerButtonPressed), for: .primaryActionTriggered)
         return button
     }()
     
     private lazy var choice4: UIButton = {
        let button = createButton()
         button.addTarget(self, action: #selector(answerButtonPressed), for: .primaryActionTriggered)
         return button
     }()
    
    private var quizVm = QuizVM()
   
    
     lazy var firstStackView = UIStackView(arrangedSubviews: [choice1, choice2])
     lazy var secondStackView = UIStackView(arrangedSubviews: [choice3, choice4])
     lazy var  buttonStackView = UIStackView(arrangedSubviews: [firstStackView,secondStackView])
    lazy var stackView = UIStackView(arrangedSubviews: [questionLabel, imageheader, buttonStackView])
    
    
    init() {
        super.init(frame: .zero)
         layout()
         style()
        updateUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    
}

extension BodySection{
    
    func style(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
     questionLabel.translatesAutoresizingMaskIntoConstraints = false
       
        questionLabel.textAlignment = .center
        questionLabel.textColor = .black
        questionLabel.isUserInteractionEnabled = true
        let guestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(labelClicked(_:)))
        questionLabel.addGestureRecognizer(guestureRecognizer)
        //Image
        imageheader.translatesAutoresizingMaskIntoConstraints = false
        imageheader.contentMode = .scaleAspectFit
        //Button
        firstStackView.axis = .vertical
        firstStackView.spacing = 8
        firstStackView.distribution = .fillEqually
        secondStackView.axis = .vertical
        secondStackView.distribution = .fillEqually
        secondStackView.spacing = 8
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 8
        
    }
    
    func layout(){
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo:leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo:trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo:bottomAnchor),
            questionLabel.heightAnchor.constraint(equalToConstant: 70),
            questionLabel.widthAnchor.constraint(equalToConstant: 200),
            imageheader.heightAnchor.constraint(equalToConstant: 400),
            imageheader.widthAnchor.constraint(equalToConstant: 200),
            buttonStackView.heightAnchor.constraint(equalToConstant: 100),
            buttonStackView.widthAnchor.constraint(equalToConstant: 200),

        ])
    }
    
}


extension BodySection{
    
    @objc func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        
        let userGotItRight = quizVm.checkAnswer(userAnswer: userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = .green
           
        } else {
            sender.backgroundColor = .red
        }
        
       // quizVm.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI() {
        
        let questionQuiz =  quizVm.nextQuestion()
        if questionQuiz {
            questionLabel.text = quizVm.getQuestionText()
        } else {
            questionLabel.text = "Quiz ended.Score: \(quizVm.getScore())"
            buttonStackView.isHidden = true
        }
            
         //  print("Score: \(quizVm.getScore())")
        
            userScore = quizVm.getScore()
            
            let answerChoices = quizVm.getAnswers()
            choice1.setTitle(answerChoices[0], for: .normal)
            choice2.setTitle(answerChoices[1], for: .normal)
            choice3.setTitle(answerChoices[2], for: .normal)
            choice4.setTitle(answerChoices[3], for: .normal)
            
            
            choice1.backgroundColor = UIColor.clear
            choice2.backgroundColor = UIColor.clear
            choice3.backgroundColor = UIColor.clear
            choice4.backgroundColor = UIColor.clear
          
            
        }
    @objc func labelClicked(_ sender: Any) {
        delegate?.quizScore(score: userScore)
        NotificationCenter.default.post(name: .logout, object: nil)
          print("UILabel clicked")
      }
        
    
}

