//
//  LaTeX Component.swift
//  
//
//  Created by Vaida on 10/19/22.
//


/// A component that makes up LaTeX.
public protocol LaTeXComponent {
    
    /// The expression in LaTeX.
    var latexExpression: String { get }
    
}
 
extension String: LaTeXComponent {
    
    public var latexExpression: String {
        self
    }
    
}

extension Double: LaTeXComponent {
    
    public var latexExpression: String {
        self.description
    }
    
}

extension Int: LaTeXComponent {
    
    public var latexExpression: String {
        self.description
    }
    
}

extension Never: LaTeXComponent {
    
    public var latexExpression: String { "" }
    
}
