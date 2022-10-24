//
//  Absolute Modifier.swift
//  
//
//  Created by Vaida on 10/22/22.
//


private struct AbsoluteModifier: LaTeXModifier {
    
    func modify(_ component: some LaTeXComponent) -> String {
        "\\left| \(component.latexExpression) \\right|"
    }
    
    func evaluated<Content: LaTeXComponent>(_ component: Content) -> EvaluatedResult<LaTeXModifiedContent<Content, Self>> {
        guard let component = component.evaluated().numericValue else { return .symbolic(component.modifier(self)) }
        
        return .numeric(abs(component))
    }
    
}


public extension LaTeXComponent {
    
    func absolute() -> some LaTeXComponent {
        self.modifier(AbsoluteModifier())
    }
    
}
