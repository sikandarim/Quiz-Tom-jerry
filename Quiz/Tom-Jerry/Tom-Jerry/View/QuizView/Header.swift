//
//  Header.swift
//  Tom-Jerry
//
//  Created by Mariam Sikandari on 2023-06-24.
//

import UIKit

class Header: UIView {

    let imageheader = UIImageView(image: UIImage(named: "header"))
    
    init() {
        super.init(frame: .zero)
         layout()
         style()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    
}

extension Header {
    
    func style(){
        imageheader.translatesAutoresizingMaskIntoConstraints = false
        imageheader.contentMode = .scaleAspectFit
    }
    
    func layout(){
        addSubview(imageheader)
        NSLayoutConstraint.activate([
            imageheader.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            imageheader.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageheader.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageheader.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageheader.trailingAnchor.constraint(equalTo: trailingAnchor)
            
        ])
      
    }
    
}
