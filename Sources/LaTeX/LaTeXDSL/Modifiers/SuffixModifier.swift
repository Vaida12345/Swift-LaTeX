//
//  Suffix Modifiers.swift
//  
//
//  Created by Vaida on 10/21/22.
//


private struct SuffixModifier: LaTeXModifier {
    
    private let suffix: String
    
    public func modify(_ component: some LaTeXComponent) -> String {
        component.latexExpression + suffix
    }
    
    func evaluated<Content: LaTeXComponent>(_ component: Content) -> EvaluatedResult<LaTeXModifiedContent<Content, Self>> {
        guard let value = component.evaluated().numericValue else { return .symbolic(component.modifier(self)) }
        
        if suffix == "!", let factorial = Int(value).factorial() {
            return .numeric(Double(factorial))
        } else {
            return .symbolic(component.modifier(self))
        }
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
