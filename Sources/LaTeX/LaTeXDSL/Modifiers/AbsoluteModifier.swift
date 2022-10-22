//
//  Absolute Modifier.swift
//  
//
//  Created by Vaida on 10/22/22.
//


struct AbsoluteModifier: LaTeXModifier {
    
    func modify(_ component: some LaTeXComponent) -> String {
        "\\left| \(component.latexExpression) \\right|"
    }
    
}


public extension LaTeXComponent {
    
    func absolute() -> some LaTeXComponent {
        self.modifier(AbsoluteModifier())
    }
    
}
