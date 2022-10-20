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
    
    init(name: String) {
        self.name = name
    }
    
}


public extension LaTeXComponent {
    
    func textStyled() -> some LaTeXComponent {
        self.modifier(InternalModifier(name: "textstyle"))
    }
    
}
