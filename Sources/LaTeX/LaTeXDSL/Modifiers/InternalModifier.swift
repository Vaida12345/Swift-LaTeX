//
//  Internal Modifier.swift
//  
//
//  Created by Vaida on 10/21/22.
//


private struct InternalModifier: LaTeXModifier {
    
    private let name: String
    
    func modify(_ component: some LaTeXComponent) -> String {
        "\\\(name) \(component.latexExpression)"
    }
    
    func evaluated<Content: LaTeXComponent>(_ component: Content) -> EvaluatedResult<LaTeXModifiedContent<Content, Self>> {
        guard let component = component.evaluated().numericValue else { return .symbolic(component.modifier(self)) }
        
        return .numeric(component)
    }
    
    init(name: String) {
        self.name = name
    }
    
}


public extension LaTeXComponent {
    
    func textStyled() -> some LaTeXComponent {
        self.modifier(InternalModifier(name: "textstyle"))
    }
    
}
