//
//  Not Component.swift
//  
//
//  Created by Vaida on 10/19/22.
//


public struct NotComponent: LaTeXModifier {
    
    public func modify(_ component: some LaTeXComponent) -> String {
        "\\not \(component.latexExpression)"
    }
    
}


public extension LaTeXComponent {
    
    /// The math accent modifier for a LaTeX component.
    ///
    /// - Parameters:
    ///   - modifier: The accent modifier.
    var not: LaTeXModifiedContent<Self, NotComponent> {
        LaTeXModifiedContent(content: self, modifier: NotComponent())
    }
    
}
