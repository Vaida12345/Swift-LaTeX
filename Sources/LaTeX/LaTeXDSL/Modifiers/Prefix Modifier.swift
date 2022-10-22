//
//  Prefix Modifier.swift
//  
//
//  Created by Vaida on 10/21/22.
//


public struct PrefixModifier: LaTeXModifier {
    
    private let prefix: String
    
    public func modify(_ component: some LaTeXComponent) -> String {
        prefix + component.latexExpression
    }
    
    fileprivate init(prefix: String) {
        self.prefix = prefix
    }
    
}


public extension LaTeXComponent {
    
    var not: LaTeXModifiedContent<Self, PrefixModifier> {
        LaTeXModifiedContent(content: self, modifier: PrefixModifier(prefix: "\\not "))
    }
    
    static prefix func -(x: Self) -> some LaTeXComponent {
        x.modifier(PrefixModifier(prefix: "-"))
    }
    
}
