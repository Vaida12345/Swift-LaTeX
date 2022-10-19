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


public extension LaTeXComponent {
    
    public static func + (lhs: LaTeXComponent, rhs: LaTeXComponent) -> LaTeXComponent {
        
    }
    
}
