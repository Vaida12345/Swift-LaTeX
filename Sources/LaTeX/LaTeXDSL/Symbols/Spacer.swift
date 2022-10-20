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
    static let and = Spacer("&")
    static let comma = Spacer("\\,")
    static let colon = Spacer("\\:")
    static let semicolon = Spacer("\\;")
    static let space = Spacer("\\ ")
    static let exclamation = Spacer("\\!")
}
