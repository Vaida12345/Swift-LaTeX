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
    
    func evaluated<Content: LaTeXComponent>(_ component: Content) -> EvaluatedResult<LaTeXModifiedContent<Content, Self>> {
        .symbolic(component.modifier(self))
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
    
    func overLined() -> some LaTeXComponent {
        self.modifier(ContainedModifier(name: "overline"))
    }
    
    func underLined() -> some LaTeXComponent {
        self.modifier(ContainedModifier(name: "underline"))
    }
    
    func overRightArrowed() -> some LaTeXComponent {
        self.modifier(ContainedModifier(name: "overrightarrow"))
    }
    
    func overLeftArrowed() -> some LaTeXComponent {
        self.modifier(ContainedModifier(name: "overleftarrow"))
    }
}
