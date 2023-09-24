//
//  Footer.swift
//  Tom-Jerry
//
//  Created by Mariam Sikandari on 2023-06-24.
//

import UIKit

class Footer: UIView {
    let imageheader = UIImageView(image: UIImage(named: "tom-food"))
    let progressBar = UIProgressView()
   
    
    init() {
        super.init(frame: .zero)
         layout()
         style()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    
}

extension Footer{
    
    func style(){
        
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        progressBar.backgroundColor = .brown
       
    }
    
    func layout(){
        addSubview(progressBar)
        NSLayoutConstraint.activate([
            progressBar.topAnchor.constraint(equalTo: topAnchor),
            progressBar.bottomAnchor.constraint(equalTo: bottomAnchor),
            progressBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            progressBar.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
     
        
    }
    
}
