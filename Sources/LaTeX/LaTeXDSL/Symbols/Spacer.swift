//
//  Spacer.swift
//  
//
//  Created by Vaida on 10/19/22.
//


public struct Spacer: LaTeXComponent {
    
    public let latexExpression: String
    
    public init(_ expression: String) {
        self.latexExpression = expression
    }
    
    public static let quad = Spacer("\\quad")
    public static let qquad = Spacer("\\qquad")
    public static let and = Spacer("&")
    public static let comma = Spacer("\\,")
    public static let colon = Spacer("\\:")
    public static let semicolon = Spacer("\\;")
    public static let space = Spacer("\\ ")
    public static let exclamation = Spacer("\\!")
}
