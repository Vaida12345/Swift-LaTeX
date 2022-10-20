//
//  Suffix Modifiers.swift
//  
//
//  Created by Vaida on 10/21/22.
//


public struct SuffixModifier: LaTeXModifier {
    
    private let suffix: String
    
    public func modify(_ component: some LaTeXComponent) -> String {
        component.latexExpression + suffix
    }
    
    internal init(suffix: String) {
        self.suffix = suffix
    }
    
}

public extension LaTeXComponent {
    
    var factorial: some LaTeXComponent {
        self.modifier(SuffixModifier(suffix: "!"))
    }
    
}
