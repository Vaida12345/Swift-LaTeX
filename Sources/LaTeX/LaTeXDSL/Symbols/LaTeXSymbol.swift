//
//  LaTeXSymbol.swift
//  
//
//  Created by Vaida on 10/20/22.
//


/// The built-in LaTeX symbols.
public struct LaTeXSymbol: LaTeXComponent, CustomStringConvertible {
    
    public let latexExpression: String
    
    public var description: String {
        self.latexExpression
    }
    
    internal init(_ latexExpression: String) {
        self.latexExpression = latexExpression
    }
    
}
