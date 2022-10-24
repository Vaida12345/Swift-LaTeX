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
    
    public func evaluated<Content: LaTeXComponent>(_ component: Content) -> EvaluatedResult<LaTeXModifiedContent<Content, Self>> {
        guard let value = component.evaluated().numericValue else { return .symbolic(component.modifier(self)) }
        
        if prefix == "-" {
            return .numeric(-1 * value)
        } else {
            return .symbolic(component.modifier(self))
        }
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
