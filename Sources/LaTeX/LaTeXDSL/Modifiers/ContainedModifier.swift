//
//  Contained Modifier.swift
//  
//
//  Created by Vaida on 10/21/22.
//


private struct ContainedModifier: LaTeXModifier {
    
    private let name: String
    
    func modify(_ component: some LaTeXComponent) -> String {
        "\\\(name){\(component.latexExpression)}"
    }
    
    init(name: String) {
        self.name = name
    }
    
}


public extension LaTeXComponent {
    
    func hidden() -> some LaTeXComponent {
        self.modifier(ContainedModifier(name: "phantom"))
    }
    
    @available(*, unavailable, renamed: "hidden")
    func phantom() -> some LaTeXComponent {
        self.modifier(ContainedModifier(name: "phantom"))
    }
    
}
