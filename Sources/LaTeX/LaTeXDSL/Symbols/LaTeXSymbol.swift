//
//  LaTeXSymbol.swift
//  
//
//  Created by Vaida on 10/20/22.
//


/// The built-in LaTeX symbols.
///
/// - Important: Do not create instances of this structure, use pre-defined ones instead.
///
/// - Note: To use the not operator, see ``not``
public struct LaTeXSymbol: LaTeXComponent, CustomStringConvertible {
    
    public let latexExpression: String
    
    /// The description of this structure.
    public var description: String {
        self.latexExpression
    }
    
    public var pyDescription: String {
        fatalError("Attempting to generate python syntax for non mathematical expression")
    }
    
    public func evaluated() -> EvaluatedResult<String> {
        .symbolic(self.latexExpression)
    }
    
    internal init(_ latexExpression: String) {
        self.latexExpression = latexExpression
    }
    
}
