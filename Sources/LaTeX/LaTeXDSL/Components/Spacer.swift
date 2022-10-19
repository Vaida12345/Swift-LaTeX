//
//  Spacer.swift
//  
//
//  Created by Vaida on 10/19/22.
//


struct Spacer: LaTeXComponent {
    
    let latexExpression: String
    
    public init(_ expression: String) {
        self.latexExpression = expression
    }
    
    static let quad = Spacer("\\quad")
    static let qquad = Spacer("\\qquad")
    static let tilde = Spacer("~")
    static let and = Spacer("&")
}
