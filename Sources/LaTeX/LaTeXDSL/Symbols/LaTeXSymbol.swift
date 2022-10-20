//
//  LaTeXSymbol.swift
//  
//
//  Created by Vaida on 10/20/22.
//


public protocol LaTeXSymbols: LaTeXComponent, CustomStringConvertible {
    
}

public extension LaTeXSymbols {
    var description: String {
        self.latexExpression
    }
}


/// The built-in LaTeX symbols.
public struct LaTeXSymbol: LaTeXSymbols {
    
    public let latexExpression: String
    
    internal init(_ latexExpression: String) {
        self.latexExpression = latexExpression
    }
    
}
