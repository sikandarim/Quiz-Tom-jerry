//
//  Body+Design.swift
//  Tom-Jerry
//
//  Created by Mariam Sikandari on 2023-06-30.
//

import UIKit
extension BodySection{
    

    public func createButton() -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .borderedTinted()
     
         return button
     }
    
}
