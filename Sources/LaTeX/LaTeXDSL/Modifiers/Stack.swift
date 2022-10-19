//
//  Stack.swift
//  
//
//  Created by Vaida on 10/19/22.
//

struct Stackrel<Content: LaTeXComponent>: LaTeXModifier {
    
    private let content: Content
    
    func modify(_ component: some LaTeXComponent) -> String {
        "\\stackrel{\(self.content.latexExpression)}{\(component.latexExpression)}"
    }
    
    init(_ content: Content) {
        self.content = content
    }
    
}

public extension LaTeXComponent {
    
    /// The math accent modifier for a LaTeX component.
    ///
    /// - Parameters:
    ///   - modifier: The accent modifier.
    func stackrel(_ component: some LaTeXComponent) -> some LaTeXComponent {
        modifier(Stackrel(component))
    }
    
}

struct Stackbin<Content: LaTeXComponent>: LaTeXModifier {
    
    private let content: Content
    
    func modify(_ component: some LaTeXComponent) -> String {
        "\\stackbin{\(self.content.latexExpression)}{\(component.latexExpression)}"
    }
    
    init(_ content: Content) {
        self.content = content
    }
    
}

public extension LaTeXComponent {
    
    /// The math accent modifier for a LaTeX component.
    ///
    /// - Parameters:
    ///   - modifier: The accent modifier.
    func stackbin(_ component: some LaTeXComponent) -> some LaTeXComponent {
        modifier(Stackbin(component))
    }
    
}
