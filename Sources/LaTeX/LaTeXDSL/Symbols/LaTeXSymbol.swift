//
//  LaTeXSymbol.swift
//  
//
//  Created by Vaida on 10/20/22.
//


/// The built-in LaTeX symbols.
///
/// - Important: Do not create instances of this structure, use pre-defined ones instead.
public struct LaTeXSymbol: LaTeXComponent, CustomStringConvertible {
    
    public let latexExpression: String
    
    /// The description of this structure.
    public var description: String {
        self.latexExpression
    }
    
    internal init(_ latexExpression: String) {
        self.latexExpression = latexExpression
    }
    
}
