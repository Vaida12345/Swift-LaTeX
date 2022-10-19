//
//  Not Component.swift
//  
//
//  Created by Vaida on 10/19/22.
//


struct NotComponent: LaTeXModifier {
    
    func modify(_ component: some LaTeXComponent) -> String {
        "\\not \(component.latexExpression)"
    }
    
}


public extension LaTeXComponent {
    
    /// The math accent modifier for a LaTeX component.
    ///
    /// - Parameters:
    ///   - modifier: The accent modifier.
    func not() -> some LaTeXComponent {
        LaTeXModifiedContent(content: self, modifier: NotComponent())
    }
    
}
