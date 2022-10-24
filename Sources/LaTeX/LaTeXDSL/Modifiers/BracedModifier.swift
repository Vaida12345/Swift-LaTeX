//
//  Braced Modifier.swift
//  
//
//  Created by Vaida on 10/21/22.
//


private struct BracedModifier<T: LaTeXComponent>: LaTeXModifier {
    
    private let position: Position
    
    private let value: Group<T>
    
    func modify(_ component: some LaTeXComponent) -> String {
        "\\\(self.position.rawValue){\(component.latexExpression)}\(position == .overBrace ? "^" : "_")\(value.latexExpression)"
    }
    
    func evaluated<Content: LaTeXComponent>(_ component: Content) -> EvaluatedResult<LaTeXModifiedContent<Content, Self>> {
        .symbolic(component.modifier(self))
    }
    
    init(position: Position, value: T) {
        self.position = position
        self.value = Group(value, shouldIncludeCurlyBrackets: true)
    }
    
    enum Position: String {
        case overBrace = "overbrace"
        case underBrace = "underbrace"
    }
    
}


public extension LaTeXComponent {
    
    func overBraced(_ value: some LaTeXComponent) -> some LaTeXComponent {
        self.modifier(BracedModifier(position: .overBrace, value: value))
    }
    
    func underBraced(_ value: some LaTeXComponent) -> some LaTeXComponent {
        self.modifier(BracedModifier(position: .underBrace, value: value))
    }
    
}
